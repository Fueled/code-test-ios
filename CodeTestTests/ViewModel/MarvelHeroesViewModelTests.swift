//
//  MarvelHeroesViewModelTests.swift
// CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import XCTest

@testable import CodeTest

final class MarvelHeroesViewModelTests: XCTestCase {
	private var viewModel: MarvelHeroesViewModel!
	private var marvelHeroesNavigation: MarvelHeroesNavigation!

	@MainActor
    override func setUp() {
		viewModel = MarvelHeroesViewModel()
		marvelHeroesNavigation = MarvelHeroesNavigation(path: [])
		viewModel.setup(navigation: marvelHeroesNavigation)
    }

	@MainActor
	func testSetupNavigation() {
		let localViewModel = MarvelHeroesViewModel()
		XCTAssertNil(localViewModel.marvelHeroesNavigation)
		localViewModel.setup(navigation: marvelHeroesNavigation)
		XCTAssertNotNil(localViewModel.marvelHeroesNavigation)
	}

	@MainActor
	func testSuccessFetchData() async {
		XCTAssertEqual(viewModel.superHeroes.count, 0)
		await viewModel.loadData()
		XCTAssertEqual(viewModel.superHeroes.count, 1)
	}

	@MainActor
	func testNavigateToCharacter() {
		XCTAssertTrue(viewModel.marvelHeroesNavigation?.path.isEmpty == true)
		viewModel.navigate(to: .example)
		XCTAssertTrue(viewModel.marvelHeroesNavigation?.path.count == 1)
	}
}
