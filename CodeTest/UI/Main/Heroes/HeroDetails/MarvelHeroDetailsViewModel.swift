//
//  MarvelHeroDetailsViewModel.swift
//  FueledTemplate
//
//  Created by full_name on date_markup.
//  Copyright © year_markup Fueled. All rights reserved.
//

import Combine
import FueledTemplateModels

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
