//
//  SubscribePlanPromptView+ViewComponents.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 6/9/24.
//

import SwiftUI

/// Methods to create different views that composes this screen
extension SubscribePlanPromptView {
  func makeNavBar() -> some View {
    HStack {
      Spacer()
      Button {
        closeButtonTapSubject.send()
      } label: {
        CloseButton().frame(
          width: Constant.closeButtonSize.width,
          height: Constant.closeButtonSize.height
        )
      }
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
      ).foregroundStyle(Constant.titleLabelTextColorIdentifier.color)
      .multilineTextAlignment(.center)
  }
  
  /// Makes bar graph with aligned image of Protty behind it.
  func makeGraphWithProttyView() -> some View {
    return VStack(alignment: .center) {
      HStack(alignment: .bottom) {
        Spacer()
        BarGraphView()
          .background { /// for Protty
            /// used to calculate the offset for Protty, by factoring the size of graph
            /// provided in design and the size of this device
            GeometryReader { geometry in
              
              /// for X axis offest
              let widthScale = ScreenScaleHelper.calculateDesignScaleReferingWidth(
                forSize: geometry.size,
                referenceSize: Constant.graphSize
              )
              /// for Y axis offset
              let heightScale = ScreenScaleHelper.calculateDesignScaleReferingHeight(
                forSize: geometry.size,
                referenceSize: Constant.graphSize
              )
              
              let prottyImageSizeScaled = CGSize(
                width: Constant.prottyImageSize.width.screenScaled,
                height: Constant.prottyImageSize.height.screenScaled
              )

              /// here is where we are adjusting the offset accordinbg to device
              let prottyOffsetScaled = CGSize(
                width: Constant.prottyOffsetFromGraph.width * widthScale,
                height: Constant.prottyOffsetFromGraph.height * heightScale
              )
              
              Image("Protty")
                  .resizable()
                  /// animate Protty when subscribe button tapped
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
      /// Shadow is handled here instead of in buttonStyle, so as to handle case where
      /// shadows may not be present at certain places (not in this use-case, for now)
    )
    .shadow(
      color: Constant.subscribeButtonShadowColorIdentifier.color,
      radius: 10.0,
      x: 0.0,
      y: 2.0
    )
    .padding(.horizontal)
  }
}

#Preview {
  SubscribePlanPromptView(
    viewModel: SubscribePlanPromptViewModel()
  )
}
