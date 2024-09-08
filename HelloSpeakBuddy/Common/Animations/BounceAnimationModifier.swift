//
//  BounceAnimationModifier.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 6/9/24.
//

import SwiftUI

extension SpeakBuddy {
  struct LivelyAnimation: ViewModifier {
    let animate: Bool
    
    func body(content: Content) -> some View {
      content.scaleEffect(animate ? 1.2 : 1.0)
        .animation(
          .interpolatingSpring(stiffness: 200, damping: 5)
          .repeatCount(1, autoreverses: true),
          value: animate
        )

    }
  }
}
