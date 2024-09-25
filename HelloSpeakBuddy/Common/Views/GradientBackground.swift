//
//  GradientBackground.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 10/9/24.
//

import SwiftUI

struct GradientBackground: View {
  enum Constant {
    static let backgroundGradientStartColorIdentifier = "backgroundGradientStartColor"
    static let backgroundGradientEndColorIdentifier = "backgroundGradientEndColor"
  }
  
  var body: some View {
    LinearGradient(
      colors: [
        Constant.backgroundGradientStartColorIdentifier.color,
        Constant.backgroundGradientEndColorIdentifier.color
      ],
      startPoint: .top,
      endPoint: .bottom
    )
  }
}
