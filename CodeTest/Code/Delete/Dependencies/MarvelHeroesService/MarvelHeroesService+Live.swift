//
//  MarvelHeroesService+Live.swift
// CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import ArkanaKeys
import Dependencies

extension MarvelHeroesService {
	public static var liveValue: MarvelHeroesService {
		MarvelHeroesService(
			fetchMarvelHeroes: {
				@Dependency(\.apiClient) var apiClient

				let fetchSuperHeroesRequest = APIRequest<ResponseData>(
					path: "v1/public/characters",
					query: Self.sharedQueryItems
				)
				let response = try await apiClient.request(fetchSuperHeroesRequest)
				return response.data.results
			}
		)
	}

	private static var sharedQueryItems: [String: String]? = {
		@Dependency(\.date) var date
		let timestamp = date.now.timeIntervalSince1970
		let hash = "\(timestamp)" + ArkanaKeys.Global().marvelAPIPrivateKey + ArkanaKeys.Global().marvelAPIPublicKey

		return [
			"apikey": ArkanaKeys.Global().marvelAPIPublicKey,
			"ts": "\(timestamp)",
			"hash": hash.md5,
		]
	}()
}
