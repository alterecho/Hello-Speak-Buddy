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
      VStack {
        maketitleLabel()
        makeGraphWithProttyView().frame(width: 270.0, height: 375.0)
        makePromoTextView().opacity(0.8)

        makeButton()
          .opacity(0.8)
          .edgesIgnoringSafeArea([.leading, .trailing, .bottom])
          .padding(
            EdgeInsets(
              top: 0.0, leading: 20.0, bottom: 54.0, trailing: 20.0
            )
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
  private func maketitleLabel() -> some View {
    Text("Hello\nSpeakBUDDY ").multilineTextAlignment(.center)
  }
  
  private func makeGraph() -> some View {
    Color(.purple).opacity(0.5)
  }

  private func makeGraphWithProttyView() -> some View {
    GeometryReader { geometry in
      makeGraph().opacity(0.8).background {
        Image("Protty")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 187.72, height: 170.0)
          .background(Color.red)
          .offset(x: -geometry.size.width * 0.5 + 37.52,
                  y: -geometry.size.height * 0.5 + 52.15)
      }

    }
  }

  private func makePromoTextView() -> some View {
    VStack {
      Text("スピークバディで")
      Text("レベルアップ")
    }
  }
  
  private func makeButton() -> some View {
    Button {
      
    } label: {
      Text("プランに登録する")
    }
  }
  
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
