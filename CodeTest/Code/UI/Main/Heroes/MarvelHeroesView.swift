//
//  MarvelHeroesView.swift
// CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import SwiftUI

struct MarvelHeroesView: View {
	@StateObject private var marvelHeroesNavigation: MarvelHeroesNavigation
	@StateObject private var viewModel = MarvelHeroesViewModel()

	init(
		navigationPath: [MarvelHeroesNavigation.Path] = []
	) {
		_marvelHeroesNavigation = StateObject(wrappedValue: MarvelHeroesNavigation(path: navigationPath))
	}

	var body: some View {
		NavigationStack(path: $marvelHeroesNavigation.path) {
			rootView
				.navigationDestination(for: marvelHeroesNavigation)
		}
		.environmentObject(marvelHeroesNavigation)
		.task {
			viewModel.setup(navigation: marvelHeroesNavigation)
			await viewModel.loadData()
		}
	}

	@ViewBuilder
	private var rootView: some View {
		if viewModel.isLoading {
			ProgressView()
		} else {
			contentView
		}
	}

	private var contentView: some View {
		ScrollView {
			VStack {
				heroesListView
			}
		}
		.accessibilityIdentifier(UITestIDs.MarvelHeroesView.scrollView.rawValue)
		.ignoresSafeArea(.all)
	}

	private var heroesListView: some View {
		ForEach(viewModel.superHeroes.indices, id: \.self) { index in
			let character = viewModel.superHeroes[index]
			MarvelCharacterView(character: character)
				.tint(.white)
				.accessibilityIdentifier("HeroesListItem\(index)")
				.onTapGesture {
					viewModel.navigate(to: character)
				}
		}
	}
}

#Preview {
	MarvelHeroesView()
}
