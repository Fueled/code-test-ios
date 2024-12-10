//
//  MarvelHeroesViewModel.swift
//  CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import Combine
import Foundation

class MarvelHeroesViewModel: ObservableObject {
	@Published var superHeroes: [MarvelCharacter] = []
	@Published var isLoading = false

	func loadData() async {
		print("Loading data for fetchMarvelHeroes")
		do {
			isLoading = true
			//TODO: Integrate with the Marvels API instead of loading data from the Sample.json file
			if let samplePath = Bundle.main.path(forResource: "Sample", ofType: "json") {
				let sampleData = try Data(contentsOf: URL(fileURLWithPath: samplePath))
				superHeroes = try JSONDecoder().decode([MarvelCharacter].self, from: sampleData)
			}
		} catch {
			print("ERROR: \(error)")
		}
		isLoading = false
	}
}
