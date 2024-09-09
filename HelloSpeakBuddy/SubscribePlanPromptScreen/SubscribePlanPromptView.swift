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
        Spacer()
          .frame(height: 7.94.screenScaled)
        makeNavBar()
          .padding(Constant.navBarInsets.screenScaled)
        Spacer()
          .frame(height: 10.0.screenScaled).background(Color.orange)
        
        makeTitleLabel()
        Spacer()
          .frame(height: 85.0.screenScaled)
        makeGraphWithProttyView()
          .padding(Constant.graphPadding.screenScaled)
        Spacer()
          .frame(height: 30.0.screenScaled)
        makePromoTextView()
        Spacer()
          .frame(height: 25.0.screenScaled)
        
        makeSubscribeButton().padding(
          Constant.subscribeButtonPadding.screenScaled
        )
        Spacer().frame(height: 54.0.screenScaled).background {
          Color.red
        }
      }
      .ignoresSafeArea(edges: [.bottom])
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
