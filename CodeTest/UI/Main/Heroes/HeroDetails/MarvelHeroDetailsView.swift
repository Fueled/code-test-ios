//
//  MarvelHeroDetailsView.swift
//  FueledTemplate
//
//  Created by full_name on date_markup.
//  Copyright © year_markup Fueled. All rights reserved.
//

import FueledTemplateHelpers
import FueledTemplateModels
import SwiftUI

struct MarvelHeroDetailsView: View {
	@EnvironmentObject private var marvelHeroesNavigation: MarvelHeroesNavigation
	@StateObject var viewModel: MarvelHeroDetailsViewModel

	var body: some View {
		VStack(spacing: 16) {
			if let character = viewModel.character {
				MarvelCharacterView(character: character)
					.tint(.black)
			}
			Text("This is a detailed view")
				.font(.subheadline)
				.accessibilityAddTraits(.isStaticText)
		}
		.accessibilityIdentifier(UITestIDs.MarvelHeroDetailsView.parent.rawValue)
		.task {
			viewModel.setup(navigation: marvelHeroesNavigation)
		}
	}
}

#Preview {
	MarvelHeroDetailsView(
		viewModel: MarvelHeroDetailsViewModel(
			character: MarvelCharacter.example
		)
	)
}
