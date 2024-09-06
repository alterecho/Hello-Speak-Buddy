//
//  SubscribePlanPromptView+ViewComponents.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 6/9/24.
//

import SwiftUI

extension SubscribePlanPromptView {
  
  func makeTitleLabel() -> some View {
    Text(Constant.pageTitle)
      .font(
        .system(
          size: Constant.titleLabelFontSize,
          weight: .bold,
          design: .default
        )
      )
      .lineSpacing(46.8.heightScaled - Constant.titleLabelFontSize)
      .multilineTextAlignment(.center)
  }
  
  
  func makeGraphWithProttyView() -> some View {
    GeometryReader { geometry in
      BarGraphView().background {
        Image("Protty")
          .modifier(
            SpeakBuddy.LivelyAnimation(
              animate: animateProtty
            )
          )
          .aspectRatio(contentMode: .fit)
          .frame(width: 187.72, height: 170.0)
          .offset(
            CGSize(
              width: -geometry.size.width * 0.5 - Constant.prottyOffsetFromGraph.width,
              height: -geometry.size.height * 0.5 - Constant.prottyOffsetFromGraph.height
            )
          )
      }
    }
  }
  
  func makePromoTextView() -> some View {
    return VStack {
      Text(Constant.levelUpText)
        .font(Font(UIFont(name: "HiraginoSans-W6", size: Constant.levelUpTextFontSize)!))
        .kerning(-0.57)
        .lineSpacing(15)
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity, alignment: .center)
      Text(Constant.speakBuddyText).modifier(SpeakBuddy.GradientTextModifier())
    }
  }
  
  func makeSubscribeButton() -> some View {
    return Button {
      performSubscribeButtonAction()
    } label: {
      Text(Constant.subscribeButtonTitle)
    }.buttonStyle(
      SpeakBuddy.ThemeButtonStyle()
      /* Shadow is handled here here instead of in buttonStyle, to handle case where
       shadows may not be present at certain placements
       */
    ).shadow(
      color: Constant.subscribeButtonShadowColor,
      radius: 10.0, x: 0.0, y: 2.0)
    .padding(.horizontal)
  }
  
  func makeGradientView() -> some View {
    return LinearGradient(
      colors: [
        Constant.backgroundGradientStartColor,
        Constant.backgroundGradientEndColor
      ],
      startPoint: .top,
      endPoint: .bottom
    )
  }
}
