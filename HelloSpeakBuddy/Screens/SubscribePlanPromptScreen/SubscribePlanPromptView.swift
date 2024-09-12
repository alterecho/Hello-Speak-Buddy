//
//  SubscribePlanPromptView.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 31/8/24.
//

import SwiftUI
import Combine

struct SubscribePlanPromptView: View {
  @ObservedObject var viewModel: SubscribePlanPromptViewModel
  
  private var viewDidAppearSubject = PassthroughSubject<Void, Never>()
  private var signupButtonTapSubject = PassthroughSubject<Void, Never>()
  var closeButtonTapSubject = PassthroughSubject<Void, Never>()
  @State var animateProtty = false
  
  @Binding var isModalPresentationBinding: Bool
  
  init(
    viewModel: SubscribePlanPromptViewModel,
    /// passed in to control dismissal of this view (done is viewModel)
    isModalPresentationBinding: Binding<Bool>? = nil
  ) {
    self.viewModel = viewModel
    _isModalPresentationBinding = isModalPresentationBinding ?? .constant(false)
    
    /// setup view model with it's needed inputs
    viewModel.transform(
      input: SubscribePlanPromptViewModel.Input(
        viewDidAppear: viewDidAppearSubject.eraseToAnyPublisher(),
        subscribeButtonTapPublisher: signupButtonTapSubject.eraseToAnyPublisher(),
        closeButtonTapPublisher: closeButtonTapSubject.eraseToAnyPublisher(),
        isModalPresentationBinding: $isModalPresentationBinding
      )
    )
  }
  
  var body: some View {
    ZStack {
      /// gradient BG
      GradientBackground().ignoresSafeArea()
      VStack {
        Spacer()
          .frame(height: 7.94.screenScaled)
        
        /// close button
        makeNavBar()
          .padding(Constant.navBarInsets.screenScaled)
        Spacer()
          .frame(height: 10.0.screenScaled)
        
        /// Hello SpeakBuddy
        makeTitleLabel()
        
        Spacer()
          .frame(height: 85.0.screenScaled)
        
        /// graph with Protty in background.
        /// Flag is used to animate after view appears
        if viewModel.output.showGraph {
          makeGraphWithProttyView().padding(Constant.graphPadding.screenScaled)
        } else {
          Spacer().padding(Constant.graphPadding.screenScaled)
        }
          
        Spacer()
          .frame(height: 30.0.screenScaled)
        
        /// スピークバディで
        /// レベルアップ
        makePromoTextView()
        
        Spacer()
          .frame(height: 25.0.screenScaled)
        
        /// プランに登録する
        /// (If iPad, set size of frame, else sets padding)
        if UIDevice.current.userInterfaceIdiom == .pad {
          let subscribeButtonSize = Constant.subscribeButtonSize.screenScaled
          makeSubscribeButton()
            .frame(width: subscribeButtonSize.width, height: subscribeButtonSize.height)
        } else {
          makeSubscribeButton()
            .padding(Constant.subscribeButtonPadding.screenScaled)
        }
        
        Spacer().frame(height: 54.0.screenScaled)
      }
      .ignoresSafeArea(edges: [.bottom])
    }.onAppear {
      // adding a delay so as to show animation after modal sheet is shown
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
        viewDidAppearSubject.send()
      }
    }.navigationBarBackButtonHidden(true)
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
