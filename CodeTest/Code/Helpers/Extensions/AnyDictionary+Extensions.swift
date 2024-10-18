//
//  AnyDictionary+Extensions.swift
// CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import Foundation

extension [String: Any] {
	var encodeToJSON: Data? {
		try? JSONSerialization.data(withJSONObject: self, options: [])
	}
}
