//
//  CloseButton.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 5/9/24.
//

import SwiftUI

struct CloseButton: View {
  enum Constant {
    static let closeButtonText = "X"
    static let fontSize: CGFloat = 20
  }
  
  var body: some View {
    GeometryReader { geometry in
      Text(Constant.closeButtonText)
        .font(
          .custom("HiraginoSans-W7", size: Constant.fontSize)
        )
        .multilineTextAlignment(.center)
        .frame(
          width: geometry.size.width,
          height: geometry.size.height
        ).background(
          Color.fromRGBA256Color(
            red: 255,
            green: 255,
            blue: 255,
            alpha: 1.0
          )
        ).cornerRadius(geometry.size.height * 0.5)
        .shadow(
          color: Color.fromRGBA256Color(
            red: 0,
            green: 0,
            blue: 0,
            alpha: 0.15
          ), radius: 10.0
        ).offset(
          CGSize(
            width: 0.0,
            height: 2.0
          )
        )
    }
  }
}

#Preview {
  SubscribePlanPromptView(viewModel: SubscribePlanPromptViewModel())
}
