//
//  ButtonStyle.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 5/9/24.
//

import SwiftUI

extension SpeakBuddy {
  // Style that rounds a button, adds a border and sets background color the theme of the app
  struct ThemeButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
      return configuration.label.font(.headline)
        .foregroundColor(
          .white
        )
        .padding()
        .frame(maxWidth: .infinity)
        .background(
          Color.fromRGBA256Color(
            red: 59,
            green: 167,
            blue: 255,
            alpha: 1.0
          )
        )
        .cornerRadius(28.66)
        .overlay {
          RoundedRectangle(cornerRadius: 28.66)
            .stroke(
              Color.fromRGBA256Color(
                red: 255,
                green: 255,
                blue: 255,
                alpha: 1.0
              ),
              lineWidth: 1.0
            )
        }
    }
  }
}
