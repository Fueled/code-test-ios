//
//  NetworkService.swift
// CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import Combine
import Dependencies
import Foundation

public protocol NetworkService {
	var isOnline: any Publisher<Bool, Never> { get }
}

private enum NetworkServiceKey: DependencyKey {
	static let liveValue: NetworkService = NetworkServiceLive()
//	static let previewValue: NetworkService = NetworkServiceTest()
//	static let testValue: NetworkService = NetworkServiceTest()
}

extension DependencyValues {
	public var networkService: NetworkService {
		get { self[NetworkServiceKey.self] }
		set { self[NetworkServiceKey.self] = newValue }
	}
}
