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
    enum Constant {
      static let backgroundColor = Color.fromRGBA256Color(
        red: 59,
        green: 167,
        blue: 255,
        alpha: 1.0
      )
      
      static let fontSize = 16.0
      
      static let textColor = Color.fromRGBA256Color(
        red: 255,
        green: 255,
        blue: 255,
        alpha: 1.0
      )

      static let borderColor = Color.fromRGBA256Color(
        red: 255,
        green: 255,
        blue: 255,
        alpha: 1.0
      )
    }
    
    func makeBody(configuration: Configuration) -> some View {
      return configuration.label
        .font(
          .custom(
            "HiraginoSans-W6",
            size: 16.0.heightScaled
          )
        )
        .foregroundStyle(Constant.textColor)
        .foregroundColor(
          .white
        )
        .padding()
        .frame(maxWidth: .infinity)
        .background(Constant.backgroundColor)
        .cornerRadius(28.66)
        .overlay {
          RoundedRectangle(cornerRadius: 28.66)
            .stroke(
              Constant.borderColor,
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
