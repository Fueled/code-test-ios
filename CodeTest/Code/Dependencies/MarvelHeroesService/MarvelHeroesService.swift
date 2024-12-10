//
//  MarvelHeroesService.swift
//  CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

public struct MarvelHeroesService {
	public var fetchMarvelHeroes: () async throws -> [MarvelCharacter]
}
