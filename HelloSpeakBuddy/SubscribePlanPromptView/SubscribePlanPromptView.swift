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
        makeNavBar()
        makeTitleLabel()
        Spacer()
        makeGraphWithProttyView().frame(
          width: Constant.graphSize.width,
          height: Constant.graphSize.width
        )
        Spacer().frame(
          maxHeight: 30.0
        )
        makePromoTextView()
        Spacer().frame(
          maxHeight: 25.0
        )
        
        makeSubscribeButton().padding(
             Constant.subscribeButtonPadding
          )
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
