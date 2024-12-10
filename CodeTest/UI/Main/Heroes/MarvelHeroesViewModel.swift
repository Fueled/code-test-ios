//
//  MarvelHeroesViewModel.swift
//  FueledTemplate
//
//  Created by full_name on date_markup.
//  Copyright © year_markup Fueled. All rights reserved.
//

import Combine
import Dependencies
import FueledTemplateHelpers
import FueledTemplateModels

@MainActor
final class MarvelHeroesViewModel: ObservableObject {
	private(set) var marvelHeroesNavigation: MarvelHeroesNavigation?
	@Published private(set) var superHeroes: [MarvelCharacter] = []
	@Published private(set) var isLoading = false

	func setup(navigation: MarvelHeroesNavigation) {
		marvelHeroesNavigation = navigation
	}

	func loadData() async {
		LogInfo("Loading data for fetchMarvelHeroes")
		do {
			isLoading = true
			@Dependency(\.marvelHeroesService) var marvelHeroesService
			superHeroes = try await marvelHeroesService.fetchMarvelHeroes()
		} catch {
			// TODO: Handle errors
		}

		isLoading = false
	}

	func navigate(to character: MarvelCharacter) {
		guard let marvelHeroesNavigation else {
			LogError("No navigation stack provided")
			return
		}
		marvelHeroesNavigation.path.append(.heroDetails(character))
	}
}
