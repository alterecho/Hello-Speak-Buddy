//
//  ButtonStyle.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 5/9/24.
//

import SwiftUI

extension SpeakBuddy {
  // Style that rounds a button, adds a border and sets background color the theme of the app (used ifor subscribe button)
  struct ThemeButtonStyle: ButtonStyle {
    enum Constant {
      static let backgroundColorIdentifier = "themeButtonBackground"
      
      static let fontSize = 16.0
      
      static let textColorIdentifier = "themeButtonText"

      static let borderColorIdentifier = "themeButtonBorder"
    }
    
    func makeBody(configuration: Configuration) -> some View {
      return configuration.label
        .font(
          .custom(
            "HiraginoSans-W6",
            size: Constant.fontSize.screenScaled
          )
        )
        .foregroundStyle(Constant.textColorIdentifier.color)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Constant.backgroundColorIdentifier.color)
        .cornerRadius(28.66)
        .overlay {
          RoundedRectangle(cornerRadius: 28.66)
            .stroke(
              Constant.borderColorIdentifier.color,
              lineWidth: 1.0
            )
        }.scaleEffect(
          configuration.isPressed ? 0.975 : 1.0
        ).animation(
          .easeOut(duration: 0.1),
          value: configuration.isPressed
        )
    }
  }
}

#Preview {
  SubscribePlanPromptView(
    viewModel: SubscribePlanPromptViewModel()
  )
}
