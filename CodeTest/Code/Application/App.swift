//
//  App.swift
// CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import Dependencies
import SwiftUI

@main
struct CodeTestApp: App {
	var body: some Scene {
		WindowGroup {
			MarvelHeroesView()
		}
	}
}

//struct UITestingView: View {
//	var body: some View {
//		withDependencies {
//			$0.marvelHeroesService = MarvelHeroesService.previewValue
//		} operation: {
//			MarvelHeroesView()
//		}
//	}
//}