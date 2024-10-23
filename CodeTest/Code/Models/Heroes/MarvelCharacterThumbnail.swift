//
//  MarvelCharacterThumbnail.swift
// CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import Foundation

public class MarvelCharacterThumbnail: Codable {
	enum CodingKeys: String, CodingKey {
		case path
		case ext = "extension"
	}
	public var path: String?
	public var ext: String?

	public init(path: String?, ext: String?) {
		self.path = path
		self.ext = ext
	}
}

extension MarvelCharacterThumbnail: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(path)
		hasher.combine(ext)
	}

	public static func == (lhs: MarvelCharacterThumbnail, rhs: MarvelCharacterThumbnail) -> Bool {
		lhs.ext == rhs.ext && lhs.path == rhs.path
	}
}
