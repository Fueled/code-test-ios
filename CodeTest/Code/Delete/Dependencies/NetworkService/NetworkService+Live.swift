//
//  NetworkService+Live.swift
// CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import Combine
import Foundation
import Network

final class NetworkServiceLive: NetworkService {
	private let isOnlineSubject = CurrentValueSubject<Bool, Never>(false)
	let isOnline: any Publisher<Bool, Never>

	private let monitor = NWPathMonitor()

	init() {
		isOnline = isOnlineSubject.eraseToAnyPublisher()

		monitor.pathUpdateHandler = { [weak self] path in
			switch path.status {
			case .satisfied:
				self?.isOnlineSubject.send(true)
			case .unsatisfied, .requiresConnection:
				self?.isOnlineSubject.send(false)
			@unknown default:
				print("Unhandled case \(path.status)")
			}
		}

		startMonitoring()
	}

	private func startMonitoring() {
		let queue = DispatchQueue(label: "NetworkMonitor")
		monitor.start(queue: queue)
	}
}
