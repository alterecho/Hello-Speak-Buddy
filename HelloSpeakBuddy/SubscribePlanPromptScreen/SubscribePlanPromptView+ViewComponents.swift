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
    Text("pageTitle")
      .font(
        .system(
          size: Constant.titleLabelFontSize.screenScaled,
          weight: .bold,
          design: .default
        )
      )
      .multilineTextAlignment(.center)
  }
  
  
  func makeGraphWithProttyView() -> some View {
    GeometryReader { geometry in
      let scale = calculateDesignScale(forSize: UIScreen.main.bounds.size)
      let prottyImageSize = CGSize(width: Constant.prottyImageSize.width * scale, height: Constant.prottyImageSize.height * scale)
      BarGraphView().background {
        Image("Protty").resizable()
          .modifier(
            SpeakBuddy.LivelyAnimation(
              animate: animateProtty
            )
          )
          .aspectRatio(contentMode: .fit)
          .frame(
            width: prottyImageSize.width,
            height: prottyImageSize.height
          )
          .offset(
            CGSize(
              width: -geometry.size.width * 0.5 - Constant.prottyOffsetFromGraph.width * scale,
              height: -geometry.size.height * 0.5 - Constant.prottyOffsetFromGraph.height * scale
            )
          )
      }
    }
  }
  
  func makePromoTextView() -> some View {
    let fontSize = Constant.levelUpTextFontSize.screenScaled
    let uiFont = UIFont(
      name: "HiraginoSans-W6",
      size: fontSize
    ) ?? .systemFont(ofSize: fontSize)
    
    return VStack {
      Text("levelUpText")
        .font(Font(uiFont))
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity, alignment: .center)
      Text("speakBuddyText")
        .modifier(SpeakBuddy.GradientTextModifier())
    }
  }
  
  func makeSubscribeButton() -> some View {
    return Button {
      performSubscribeButtonAction()
    } label: {
      Text("subscribeButtonTitle")
    }.buttonStyle(
      SpeakBuddy.ThemeButtonStyle()
      /* Shadow is handled here instead of in buttonStyle, so as to handle case where
       shadows may not be present at certain places (not in this use-case, for now)
       */
    )
    .shadow(
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

#Preview {
  SubscribePlanPromptView(
    viewModel: SubscribePlanPromptViewModel()
  )
}
