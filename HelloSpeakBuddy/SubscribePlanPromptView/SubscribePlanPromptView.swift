//
//  SubscribePlanPromptView.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 31/8/24.
//

import SwiftUI
import Combine

struct SubscribePlanPromptView: View {
  @State var viewModel: SubscribePlanPromptViewModel
  
  private var viewDidAppearSubject = PassthroughSubject<Void, Never>()
  private var signupButtonTapSubject = PassthroughSubject<Void, Never>()
  @State var animateProtty = false

  init(viewModel: SubscribePlanPromptViewModel) {
    self.viewModel = viewModel
    viewModel.transform(
      input: SubscribePlanPromptViewModel.Input(
        viewDidAppear: viewDidAppearSubject.eraseToAnyPublisher(),
        subscribeButtonTapPublisher: signupButtonTapSubject.eraseToAnyPublisher()
      )
    )
  }

  var body: some View {
    ZStack {
      makeGradientView().ignoresSafeArea()
      VStack {
        maketitleLabel()
        Spacer().frame(
          height: 85.0
        )
        makeGraphWithProttyView().frame(
          width: Constant.graphSize.width.screenScaled,
          height: Constant.graphSize.width.screenScaled
        )
        Spacer().frame(
          height: 30.0
        )
        makePromoTextView().opacity(0.8)
        Spacer().frame(
          height: 25.0
        )
        
        makeSubscribeButton()
          .edgesIgnoringSafeArea([
            .leading,
            .trailing,
            .bottom
          ]).padding(
             Constant.subscribeButtonPadding.screenScaled
          )
      }.overlay {
        GeometryReader { geometry in
          CloseButton().frame(
            width: Constant.closeButtonSize.width.screenScaled,
            height: Constant.closeButtonSize.height.screenScaled
          ).offset(
            CGSize(
              width: geometry.size.width - Constant.closeButtonSize.width.screenScaled - 20.0,
              height: -Constant.closeButtonSize.height.screenScaled * 0.5 + 7.94
            )
          )
        }
      }
    }.onAppear {
      viewDidAppearSubject.send()
    }
  }
  
  var activityIndicator: some View {
    return ProgressView().progressViewStyle(.circular)
  }
}

extension SubscribePlanPromptView {
  func performSubscribeButtonAction() {
    vibrateForSubscribeButtonTap()
    animateProtty = true
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      animateProtty = false
    }
  }
      
  func vibrateForSubscribeButtonTap() {
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .soft)
    feedbackGenerator.impactOccurred()
  }
}

#Preview {
  SubscribePlanPromptView(
    viewModel: SubscribePlanPromptViewModel()
  )
}
