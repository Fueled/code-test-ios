//
//  MarvelHeroDetailsViewModel.swift
// CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import Combine

class MarvelHeroDetailsViewModel: ObservableObject {
	private(set) var marvelHeroesNavigation: MarvelHeroesNavigation?

	func setup(navigation: MarvelHeroesNavigation) {
		marvelHeroesNavigation = navigation
	}
}
