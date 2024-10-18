//
//  MarvelHeroesService.swift
// CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import Dependencies

public struct MarvelHeroesService {
	public var fetchMarvelHeroes: () async throws -> [MarvelCharacter]
}

extension MarvelHeroesService: DependencyKey {
	public static let testValue = Self.previewValue
}

extension DependencyValues {
	public var marvelHeroesService: MarvelHeroesService {
		get { self[MarvelHeroesService.self] }
		set { self[MarvelHeroesService.self] = newValue }
	}
}
