//
//  MarvelHeroDetailsViewModel.swift
// CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import Combine

final class MarvelHeroDetailsViewModel: ObservableObject {
	private(set) var marvelHeroesNavigation: MarvelHeroesNavigation?
	@Published private(set) var character: MarvelCharacter?

	init(character: MarvelCharacter) {
		self.character = character
	}

	init(id: Int) {
		// TODO: initialize with API call from id
		character = .example
	}

	func setup(navigation: MarvelHeroesNavigation) {
		marvelHeroesNavigation = navigation
	}
}
