//
//  CloseButton.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 5/9/24.
//

import SwiftUI

struct CloseButton: View {
  enum Constant {
    static let closeButtonText = "×"
    static let fontSize: CGFloat = 20
    static let textColor = Color.fromRGBA256Color(
      red: 50,
      green: 53,
      blue: 55,
      alpha: 1.0
    )
    
    static let backgroundColor = Color.fromRGBA256Color(
      red: 255,
      green: 255,
      blue: 255,
      alpha: 1.0
    )
    
    static let shadowColor = Color.fromRGBA256Color(
      red: 0,
      green: 0,
      blue: 0,
      alpha: 0.15
    )
    static let shadowRadius = 10.0
    static let shadowOffset = CGSize(width: 0.0, height: 2.0)
  }
  
  var body: some View {
    GeometryReader { geometry in
      Text(Constant.closeButtonText)
        .font(
          .custom(
            "HiraginoSans-W6",
            size: Constant.fontSize
          )
        )
        .baselineOffset(4.0)
        .foregroundStyle(Constant.textColor)
        .frame(
          width: geometry.size.width,
          height: geometry.size.height,
          alignment: .center
        )
        .background(Constant.backgroundColor)
        .cornerRadius(geometry.size.height * 0.5)
        .shadow(
          color: Constant.shadowColor,
          radius: Constant.shadowRadius,
          x: Constant.shadowOffset.width,
          y: Constant.shadowOffset.height
        )
    }
  }
}

#Preview {
  SubscribePlanPromptView(
    viewModel: SubscribePlanPromptViewModel()
  )
}
