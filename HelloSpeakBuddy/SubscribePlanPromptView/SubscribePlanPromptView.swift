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
        Spacer(minLength: 25.0)
        makeSubscribeButton()
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
    Text("Hello\nSpeakBUDDY ")
      .multilineTextAlignment(.center)
      .font(
        Font(
          UIFont.systemFont(
            ofSize: 36.0,
            weight: .init(700.0)
          )
        )
      )
      .frame(maxWidth: .infinity, alignment: .center)
      .lineSpacing(10.8)
      .multilineTextAlignment(.center)
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
          .offset(x: -geometry.size.width * 0.5 + 37.52,
                  y: -geometry.size.height * 0.5 + 52.15)
      }

    }
  }

  private func makePromoTextView() -> some View {
    return VStack {
      Text("スピークバディで")
        .font(Font(UIFont(name: "HiraginoSans-W6", size: 20.0)!))
        .kerning(-0.57)
        .lineSpacing(15)
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity, alignment: .center)

      LinearGradient(
            colors: [
              Color.fromRGBA256Color(red: 111, green: 212, blue: 255, alpha: 255),
              Color.fromRGBA256Color(red: 0, green: 117, blue: 255, alpha: 255)
            ],
            startPoint: .top,
            endPoint: .bottom
      ).frame(height: 45.0)
      .mask {
        Text("レベルアップ")
          .font(Font(UIFont(name: "HiraginoSans-W6", size: 30)!))
          .kerning(-0.57)
          .lineSpacing(15)
          .multilineTextAlignment(.center)
          .frame(maxWidth: .infinity, alignment: .center)
      }
    }
  }
  
  private func makeSubscribeButton() -> some View {
    return Button {
      
    } label: {
      Text("プランに登録する")
        .font(.headline)
        .foregroundColor(    
          .white
        )
        .padding()
        .frame(maxWidth: .infinity)
        .background(
          Color.fromRGBA256Color(red: 59, green: 167, blue: 255, alpha: 255)
          )
        .border(
          Color.fromRGBA256Color(red: 255, green: 255, blue: 255, alpha: 255),
          width: 1.0
        )
        .cornerRadius(28.66)
        .shadow(radius: 10.0, x: 0.0, y: 2.0)
        .padding(.horizontal)
    }
  }
  
  private func makeGradientView() -> some View {
    let rgbaTop = [213, 210, 255, 255].map { Double($0 / 255.0) }
    let rgbaBottom = [255, 255, 255, 255].map { Double($0 / 255.0) }
    return LinearGradient(
      colors: [
        Color.fromRGBA256Color(red: 213, green: 210, blue: 255, alpha: 255),
        Color.fromRGBA256Color(red: 255, green: 255, blue: 255, alpha: 255)
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
