//
//  GradientTextModifier.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 5/9/24.
//

import SwiftUI

extension SpeakBuddy {
  struct GradientTextModifier: ViewModifier {
    func body(content: Content) -> some View {
      LinearGradient(
        colors: [
          Color.fromRGBA256Color(red: 111, green: 212, blue: 255, alpha: 1.0),
          Color.fromRGBA256Color(red: 0, green: 117, blue: 255, alpha: 1.0)
        ],
        startPoint: .top,
        endPoint: .bottom
      ).frame(height: 45.0)
        .mask {
          content.font(Font(UIFont(name: "HiraginoSans-W6", size: 30)!))
            .kerning(-0.57)
            .lineSpacing(15)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
  }
}
