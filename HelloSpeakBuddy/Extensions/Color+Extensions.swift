//
//  Color+Extensions.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 4/9/24.
//

import SwiftUI
import CoreGraphics

extension Color {
  static func fromRGBA256Color(red: Int, green: Int, blue: Int, alpha: Double) -> Color {
    let normalizedRGBAColor = [
      red,
      green,
      blue
    ].map {
      CGFloat($0) / 255.0
    }
    return Color(
      red: normalizedRGBAColor[0],
      green: normalizedRGBAColor[1],
      blue: normalizedRGBAColor[2]
    )
    .opacity(alpha)
  }
}
