//
//  SubscribePlanPromptView+ViewComponents.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 6/9/24.
//

import SwiftUI

extension SubscribePlanPromptView {
  func makeNavBar() -> some View {
    HStack {
      Spacer()
      CloseButton().frame(
        width: Constant.closeButtonSize.width,
        height: Constant.closeButtonSize.height
      )
    }
  }
  
  func makeTitleLabel() -> some View {
    Text(Constant.pageTitle)
      .font(
        .system(
          size: Constant.titleLabelFontSize,
          weight: .bold,
          design: .default
        )
      )
      .multilineTextAlignment(.center)
  }
  
  
  func makeGraphWithProttyView() -> some View {
    GeometryReader { geometry in
      BarGraphView().background {
        Image("Protty").resizable()
          .modifier(
            SpeakBuddy.LivelyAnimation(
              animate: animateProtty
            )
          )
          .aspectRatio(contentMode: .fit)
          .frame(
            width: Constant.prottyImageSize.screenScaled.width,
            height: Constant.prottyImageSize.screenScaled.height
          )
          .offset(
            CGSize(
              width: -geometry.size.width * 0.5 - Constant.prottyOffsetFromGraph.screenScaled.width,
              height: -geometry.size.height * 0.5 - Constant.prottyOffsetFromGraph.screenScaled.height
            )
          )
      }
    }
  }
  
  func makePromoTextView() -> some View {
    return VStack {
      Text(Constant.levelUpText)
        .font(Font(UIFont(name: "HiraginoSans-W6", size: Constant.levelUpTextFontSize)!))
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity, alignment: .center)
      Text(Constant.speakBuddyText)
        .modifier(SpeakBuddy.GradientTextModifier())
    }
  }
  
  func makeSubscribeButton() -> some View {
    return Button {
      performSubscribeButtonAction()
    } label: {
      Text(Constant.subscribeButtonTitle)
    }.buttonStyle(
      SpeakBuddy.ThemeButtonStyle()
      /* Shadow is handled here instead of in buttonStyle, so as to handle case where
       shadows may not be present at certain places (not in this use-case, for now)
       */
    ).shadow(
      color: Constant.subscribeButtonShadowColor,
      radius: 10.0,
      x: 0.0,
      y: 2.0
    )
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
