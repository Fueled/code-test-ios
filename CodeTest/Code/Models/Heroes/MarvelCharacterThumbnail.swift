//
//  MarvelCharacterThumbnail.swift
// CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import Foundation

public struct MarvelCharacterThumbnail: Codable, Hashable {
	enum CodingKeys: String, CodingKey {
		case path
		case ext = "extension"
	}
	public let path: String?
	public let ext: String?

	public init(path: String?, ext: String?) {
		self.path = path
		self.ext = ext
	}
}
