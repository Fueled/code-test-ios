//
//  String+Hash.swift
// CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import CryptoKit
import Foundation

extension String {
	public var md5: String {
		let data = self.data(using: .utf8)!
		return Insecure.MD5
			.hash(data: data)
			.map { String(format: "%02x", $0) }
			.joined()
	}
}
