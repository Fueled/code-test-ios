//
//  MarvelHeroesView.swift
// CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import SwiftUI

struct MarvelHeroesView: View {
	@StateObject private var viewModel = MarvelHeroesViewModel()

	var body: some View {
		rootView
			.task {
				await viewModel.loadData()
			}
	}

	@ViewBuilder
	var rootView: some View {
		contentView
	}

	var contentView: some View {
		ScrollView {
			VStack {
				heroesListView
			}
		}
		.accessibilityIdentifier(UITestIDs.MarvelHeroesView.scrollView.rawValue)
		.ignoresSafeArea(.all)
	}

	var heroesListView: some View {
		ForEach(viewModel.superHeroes.indices, id: \.self) { index in
			let character = viewModel.superHeroes[index]
			MarvelCharacterView(character: character)
				.tint(.white)
		}
	}
}

#Preview {
	MarvelHeroesView()
}
