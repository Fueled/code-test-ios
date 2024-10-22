//
//  MarvelHeroesViewModel.swift
// CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import Combine
import Foundation

@MainActor
class MarvelHeroesViewModel: ObservableObject {
	private(set) var marvelHeroesNavigation: MarvelHeroesNavigation?
	@Published private(set) var superHeroes: [MarvelCharacter] = []
	@Published private(set) var isLoading = false

	func setup(navigation: MarvelHeroesNavigation) {
		marvelHeroesNavigation = navigation
	}

	func loadData() async {
		print("Loading data for fetchMarvelHeroes")
		do {
			isLoading = true

			if let samplePath = Bundle.main.path(forResource: "Sample", ofType: "json") {
				let sampleData = try Data(contentsOf: URL(fileURLWithPath: samplePath))
				superHeroes = try JSONDecoder().decode([MarvelCharacter].self, from: sampleData)
			}
		} catch {
			print("ERROR: \(error)")
		}

		isLoading = false
	}

	func navigate(to character: MarvelCharacter) {
		guard let marvelHeroesNavigation else {
			print("No navigation stack provided")
			return
		}
		marvelHeroesNavigation.path.append(.heroDetails(character))
	}
}
