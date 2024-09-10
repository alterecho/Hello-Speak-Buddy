//
//  GradientBackground.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 10/9/24.
//

import SwiftUI

struct GradientBackground: View {
  enum Constant {
    static let backgroundGradientStartColor = Color.fromRGBA256Color(
      red: 213,
      green: 210,
      blue: 255,
      alpha: 1.0
    )
    
    static let backgroundGradientEndColor = Color.fromRGBA256Color(
      red: 255,
      green: 255,
      blue: 255,
      alpha: 1.0
    )
  }
  
  var body: some View {
    LinearGradient(
      colors: [
        Constant.backgroundGradientStartColor,
        Constant.backgroundGradientEndColor
      ],
      startPoint: .top,
      endPoint: .bottom
    )
  }
}
