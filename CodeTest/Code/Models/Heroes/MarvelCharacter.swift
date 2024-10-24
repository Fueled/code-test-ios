//
//  MarvelCharacter.swift
//  CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import Foundation

public class MarvelCharacter: Codable, Hashable {
	public var name: String
	public var id: Int
	public var description: String
	public var thumbnail: MarvelCharacterThumbnail

	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}

	public var imageString: String? {
		return thumbnail.path! + "." + thumbnail.ext!
	}

	public init(name: String, id: Int, description: String, thumbnail: MarvelCharacterThumbnail) {
		self.name = name
		self.id = id
		self.description = description
		self.thumbnail = thumbnail
	}
}

extension MarvelCharacter: Equatable {
	public static func == (lhs: MarvelCharacter, rhs: MarvelCharacter) -> Bool {
		lhs.id == rhs.id
	}
}

extension MarvelCharacter {
	public static var example: MarvelCharacter {
		MarvelCharacter(
			name: "A.I.M",
			id: 102123,
			description: "AIM is a terrorist organization bent on destroying the world.",
			thumbnail: MarvelCharacterThumbnail(path: "", ext: "")
		)
	}
}
