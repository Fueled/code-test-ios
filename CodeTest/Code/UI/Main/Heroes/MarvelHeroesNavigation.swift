//
//  MarvelHeroesNavigation.swift
// CodeTest
//
//  Created by Robert Deans on 11/22/23.
//  Copyright © 2023 Fueled. All rights reserved.
//

import SwiftUI

final class MarvelHeroesNavigation: NavigationStackManager {
	@Published var path: [Path]

	init(path: [Path]) {
		self.path = path
	}
}

extension MarvelHeroesNavigation {
	enum Path: NavigationPathProtocol {
		case heroDetails(MarvelCharacter)
		case heroDetailsID(Int)

		var destination: some View {
			switch self {
			case .heroDetails(let character):
				MarvelHeroDetailsView(viewModel: MarvelHeroDetailsViewModel(character: character))
			case .heroDetailsID(let id):
				MarvelHeroDetailsView(viewModel: MarvelHeroDetailsViewModel(id: id))
			}
		}
	}
}
