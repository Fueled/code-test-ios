//
//  MarvelCharacterView.swift
//  FueledTemplate
//
//  Created by full_name on date_markup.
//  Copyright © year_markup Fueled. All rights reserved.
//

import FueledTemplateModels
import NukeUI
import SwiftUI

struct MarvelCharacterView: View {
	let character: MarvelCharacter

	var body: some View {
		ZStack {
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
			.clipped()
			.accessibilityLabel(character.name)
			.accessibilityAddTraits(.isImage)
		}
	}

	private var infoView: some View {
		VStack(spacing: .zero) {
			Spacer()
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
		}
	}
}

#Preview {
	MarvelCharacterView(
		character: MarvelCharacter.example
	)
}
