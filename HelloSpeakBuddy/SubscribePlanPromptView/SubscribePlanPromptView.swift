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
  let button = Button {
    
  } label: {
    Text("Subscribe")
  }
  
  private var viewDidAppearSubject = PassthroughSubject<Void, Never>()
  private var signupButtonTapSubject = PassthroughSubject<Void, Never>()

  init(viewModel: SubscribePlanPromptViewModel) {
    self.viewModel = viewModel
    viewModel.transform(
      input: SubscribePlanPromptViewModel.Input(
        viewDidAppear: viewDidAppearSubject.eraseToAnyPublisher(),
        subscribeButtonTapPublisher: signupButtonTapSubject.eraseToAnyPublisher()))
  }

  var body: some View {
    ZStack {
      makeGradientView().ignoresSafeArea()
    }.onAppear {
      viewDidAppearSubject.send()
    }
  }
  
  var activityIndicator: some View {
    return ProgressView().progressViewStyle(.circular)
  }
  
}

extension SubscribePlanPromptView {
  private func makeGradientView() -> some View {
    let rgbaTop = [213, 210, 255, 255].map { Double($0 / 255.0) }
    let rgbaBottom = [255, 255, 255, 255].map { Double($0 / 255.0) }
    return LinearGradient(

      colors: [
        Color(
          red: rgbaTop[0],
          green: rgbaTop[1],
          blue: rgbaTop[2],
          opacity: rgbaTop[3]),
        Color(
          red: rgbaBottom[0],
          green: rgbaBottom[1],
          blue: rgbaBottom[2],
          opacity: rgbaBottom[3]
        ),
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
