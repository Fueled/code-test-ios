//
//  APIClient+Live.swift
// CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import Foundation

final class APIClientLive: APIClient {
	func request<Response>(_ request: APIRequest<Response>) async throws -> Response where Response: Decodable {
		let urlRequest = try request.makeRequest(using: URL(string: "https://gateway.marvel.com")!)

		let (data, response) = try await URLSession.shared.data(for: urlRequest)
		try response.validate(with: data)
		return try request.decoder.decode(Response.self, from: data)
	}

	func noResponseRequest(_ request: NoResponseRequest) async throws {
		let urlRequest = try request.makeRequest(using: URL(string: "https://gateway.marvel.com")!)
		let (data, response) = try await URLSession.shared.data(for: urlRequest)
		try response.validate(with: data)
	}
}

extension APIRequest {
	fileprivate func makeRequest(using baseURL: URL) throws -> URLRequest {
		guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
			throw URLError(.badURL)
		}

		components.path = path.isEmpty ? "" : "/" + path

		if let query {
			let queryItems = createQueryItems(from: query)
			components.queryItems = queryItems
		}

		guard let url = components.url else {
			throw URLError(.unsupportedURL)
		}

		var urlRequest = URLRequest(url: url)
		urlRequest.httpMethod = method.stringValue

		if case let .post(body) = method {
			urlRequest.httpBody = body.encodeToJSON
			urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
		} else if case let .put(body) = method {
			urlRequest.httpBody = body.encodeToJSON
			urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
		}

		headers?.forEach { key, value in
			urlRequest.setValue(value.description, forHTTPHeaderField: key)
		}
		return urlRequest
	}

	private func createQueryItems(from query: [String: any Decodable]) -> [URLQueryItem] {
		query.flatMap { key, value in
			// If the value is an array, create multiple items, otherwise create a single item.
			if let arrayOfValues = value as? [any CustomStringConvertible] {
				return arrayOfValues.map { URLQueryItem(name: key, value: "\($0)") }
			} else {
				return [URLQueryItem(name: key, value: "\(value)")]
			}
		}
	}
}

fileprivate extension URLResponse {
	func validate(with data: Data? = nil) throws {
		guard let httpResponse = self as? HTTPURLResponse else {
			return
		}

		if (200...226).contains(httpResponse.statusCode) {
			return
		}

		var responseDict = [String: Any]()
		if  let data,
			let dict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
			responseDict = dict
		}

		throw APIError.serverError(statusCode: httpResponse.statusCode, response: responseDict)
	}
}
