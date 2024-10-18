//
//  MarvelHeroesViewUITests.swift
//  FueledTemplate
//
//  Created by full_name on date_markup.
//  Copyright © year_markup Fueled. All rights reserved.
//

import XCTest

// MARK: Initial Setup
final class MarvelHeroesViewUITests: XCTestCase {
	private let app = TemplateApp()

	override func setUpWithError() throws {
		continueAfterFailure = false
		app.launch()
	}
}

// MARK: Tests
extension MarvelHeroesViewUITests {
	@available(iOS 17.0, *)
	func testAccessibility() throws {
		try app.performAccessibilityAudit()
	}

	func testScrollView() {
		let scrollView = app.scrollView(id: UITestIDs.MarvelHeroesView.scrollView.rawValue)
		let scrollViewExists = scrollView.waitForExistence(timeout: 2)
		XCTAssertTrue(scrollViewExists, "Did not find marvelHeroesViewScrollView")

		scrollView.swipeUp(velocity: .slow)
		scrollView.swipeUp()
		scrollView.swipeDown(velocity: .fast)
	}
}
