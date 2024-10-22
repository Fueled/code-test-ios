//
//  MarvelHeroDetailsView.swift
// CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import SwiftUI

struct MarvelHeroDetailsView: View {
	@EnvironmentObject private var marvelHeroesNavigation: MarvelHeroesNavigation
	@StateObject var viewModel: MarvelHeroDetailsViewModel

	var body: some View {
		VStack(spacing: .zero) { }
		.accessibilityIdentifier(UITestIDs.MarvelHeroDetailsView.parent.rawValue)
		.task {
			viewModel.setup(navigation: marvelHeroesNavigation)
		}
	}
}
