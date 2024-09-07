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
      static let gradientColorStart = Color.fromRGBA256Color(
        red: 111,
        green: 212,
        blue: 255,
        alpha: 1.0
      )
      static let gradientColorEnd = Color.fromRGBA256Color(
        red: 0,
        green: 117,
        blue: 255,
        alpha: 1.0
      )
      
      static let fontSize: CGFloat = 30.0
    }
    
    func body(content: Content) -> some View {
      LinearGradient(
        colors: [
          Constant.gradientColorStart,
          Constant.gradientColorEnd
        ],
        startPoint: .top,
        endPoint: .bottom
      )
      .frame(height: 45.0)
      .mask {
        content
          .font(
            Font(UIFont(name: "HiraginoSans-W6", size: Constant.fontSize)!)
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
