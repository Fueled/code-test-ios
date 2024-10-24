//
//  MarvelCharacterView.swift
//  CodeTest
//
//  Created by Samuel Skelton on 18 October, 2024.
//  Copyright © 2024 Fueled. All rights reserved.
//

import SwiftUI

struct MarvelCharacterView: View {
	let character: MarvelCharacter

	var body: some View {
		VStack(spacing: 0) {
			ZStack(alignment: .bottom) {
				imageView
					.overlay {
						Color.black.opacity(0.3)
					}
				infoView
			}
		}
	}

	@ViewBuilder
	var imageView: some View {
		if
			let urlString = character.imageString,
			let url = URL(string: urlString)
		{
			AsyncImage(url: url)
			.frame(maxWidth: .infinity)
			.frame(height: 200)
			.accessibilityLabel(character.name)
			.accessibilityAddTraits(.isImage)
			.clipped()
		}
	}

	var infoView: some View {
		VStack() {
			Spacer()
				.frame(maxHeight: .infinity)

			HStack() {
				VStack(alignment: .leading, spacing: 6) {
					Text(character.name)
						.font(.title)
						.accessibilityLabel(character.name)
						.accessibilityAddTraits(.isHeader)
						.clipped()
					let characterDescriptionText = character.description.isEmpty ? Text("No description available") : Text(character.description)
					characterDescriptionText
						.font(.subheadline)
						.frame(maxWidth: .infinity, alignment: .leading)
						.lineLimit(6)
						.accessibilityLabel(characterDescriptionText)
						.accessibilityAddTraits(.isStaticText)
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
