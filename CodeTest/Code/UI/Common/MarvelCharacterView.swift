//
//  MarvelCharacterView.swift
// CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import NukeUI
import SwiftUI

struct MarvelCharacterView: View {
	let character: MarvelCharacter

	var body: some View {
		ZStack(alignment: .bottom) {
			imageView
				.overlay {
					Color.black.opacity(0.7)
				}
			infoView
		}
	}

	@ViewBuilder
	private var imageView: some View {
		if
			let urlString = character.imageString,
			let url = URL(string: urlString)
		{
			LazyImage(
				source: ImageRequest(url: url),
				resizingMode: .aspectFill
			)
			.frame(maxWidth: .infinity)
			.frame(height: 200)
			.accessibilityLabel(character.name)
			.accessibilityAddTraits(.isImage)
		}
	}

	private var infoView: some View {
		VStack() {
			Spacer()
				.frame(maxHeight: .infinity)

			HStack() {
				VStack(alignment: .leading, spacing: 6) {
					Text(character.name)
						.font(.title)
						.frame(maxWidth: .infinity, alignment: .leading)
						.accessibilityLabel(character.name)
						.accessibilityAddTraits(.isHeader)
						.frame(width: 75, height: 10)
						.clipped()
					let characterDescriptionText = character.description.isEmpty ? Text("No description available") : Text(character.description)
					characterDescriptionText
						.font(.subheadline)
						.frame(maxWidth: .infinity, alignment: .leading)
						.lineLimit(6)
						.accessibilityLabel(characterDescriptionText)
						.accessibilityAddTraits(.isStaticText)
						.frame(width: 100)
				}
				.foregroundStyle(.tint)
				.padding(6)
				Spacer()
			}
		}
	}
}

#Preview {
	MarvelCharacterView(
		character: MarvelCharacter.example
	)
}
