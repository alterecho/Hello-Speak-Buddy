//
//  GradientTextModifier.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 5/9/24.
//

import SwiftUI

extension SpeakBuddy {
  struct GradientTextModifier: ViewModifier {
    private enum Constant {
      static let gradientStartColorIdentifier = "gradientTextModifierStart"
      static let gradientEndColorIdentifier = "gradientTextModifierEnd"
      
      static let fontSize: CGFloat = 30.0
    }
    
    func body(content: Content) -> some View {
      let fontSize = Constant.fontSize
      let uiFont = UIFont(
        name: "HiraginoSans-W6",
        size: fontSize
      ) ?? .systemFont(ofSize: fontSize)

      LinearGradient(
        colors: [
          Constant.gradientStartColorIdentifier.color,
          Constant.gradientEndColorIdentifier.color
        ],
        startPoint: .top,
        endPoint: .bottom
      )
      .frame(height: 45.0)
      .mask {
        content
          .font(
            Font(uiFont)
          )
          .frame(
            maxWidth: .infinity,
            alignment: .center
          )
      }
    }
  }
}

#Preview {
  SubscribePlanPromptView(
    viewModel: SubscribePlanPromptViewModel()
  )
}
