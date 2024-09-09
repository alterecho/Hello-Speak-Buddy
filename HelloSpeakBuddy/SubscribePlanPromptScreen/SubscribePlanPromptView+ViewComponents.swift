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
    return VStack(alignment: .center) {
      HStack(alignment: .bottom) {
        Spacer()
        BarGraphView()
          .background {
            GeometryReader { geometry in
              let referenceSize = CGSize(width: 270.0, height: 325.0)
              let widthScale = calculateDesignScaleReferingWidth(forSize: geometry.size, referenceSize: referenceSize)

              let heightScale = calculateDesignScaleReferingHeight(forSize: geometry.size, referenceSize: referenceSize)

              let prottyImageSizeScaled = CGSize(
                width: Constant.prottyImageSize.width.screenScaled,
                height: Constant.prottyImageSize.height.screenScaled
              )

              let prottyOffsetScaled = CGSize(
                width: Constant.prottyOffsetFromGraph.width * widthScale,
                height: Constant.prottyOffsetFromGraph.height * heightScale
              )
              
              Image("Protty")
                  .resizable()
                  .modifier(
                    SpeakBuddy.LivelyAnimation(
                      animate: animateProtty
                    )
                  )
                  .aspectRatio(contentMode: .fit)
                  .frame(
                    width: prottyImageSizeScaled.width,
                    height: prottyImageSizeScaled.width
                  )
                  .offset(
                    CGSize(
                      width: prottyOffsetScaled.width,
                      height: prottyOffsetScaled.height
                    )
                  )
            }
        }
        Spacer()
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
