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
	let isDetailView: Bool

	var body: some View {
		ZStack(alignment: isDetailView ? .top : .bottom) {
			imageView
				.overlay {
					Color.black.opacity(isDetailView ? 0.0 : 0.7)
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
			.frame(height: isDetailView ? 350 : 200)
			.clipped()
			.accessibilityLabel(character.name)
			.accessibilityAddTraits(.isImage)
		}
	}

	private var infoView: some View {
		VStack(spacing: .zero) {
			Spacer()
				.frame(maxHeight: isDetailView ? 350 : .infinity)

			VStack(alignment: .leading, spacing: 6) {
				Text(character.name)
					.font(.title)
					.frame(maxWidth: .infinity, alignment: .leading)
					.accessibilityLabel(character.name)
					.accessibilityAddTraits(.isHeader)
				let characterDescriptionText = character.description.isEmpty ? Text("No description available") : Text(character.description)
				characterDescriptionText
					.font(.subheadline)
					.frame(maxWidth: .infinity, alignment: .leading)
					.accessibilityLabel(characterDescriptionText)
					.accessibilityAddTraits(.isStaticText)
			}
			.foregroundStyle(.tint)
			.padding(6)
			Spacer()
		}
	}
}

#Preview {
	MarvelCharacterView(
		character: MarvelCharacter.example,
		isDetailView: false
	)
}
