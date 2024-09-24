//
//  CloseButton.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 5/9/24.
//

import SwiftUI

struct CloseButton: View {
  enum Constant {
    static let fontSize: CGFloat = 20
    static let closeButtonText = "closeButtonText"
    static let backgroundColorIdentifier = "closeButtonBackground"
    static let shadowColorIdentifier = "closeButtonShadow"
    
    static let shadowRadius = 10.0
    static let shadowOffset = CGSize(width: 0.0, height: 2.0)
  }
  
  var body: some View {
    GeometryReader { geometry in
      Text("closeButtonText")
        .font(
          .custom(
            "HiraginoSans-W6",
            size: Constant.fontSize
          )
        )
        .baselineOffset(4.0)
        .foregroundStyle(Color(Constant.closeButtonText))
        .frame(
          width: geometry.size.width,
          height: geometry.size.height,
          alignment: .center
        )
        .background(Constant.backgroundColorIdentifier.color)
        .cornerRadius(geometry.size.height * 0.5)
        .shadow(
          color: Constant.shadowColorIdentifier.color,
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
