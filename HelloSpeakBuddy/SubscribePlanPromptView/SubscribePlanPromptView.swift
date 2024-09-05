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
          width: 270.0,
          height: 325.0
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
            EdgeInsets(
              top: 0.0,
              leading: 20.0,
              bottom: 0.0,
              trailing: 20.0
            )
          )
      }.overlay {
        GeometryReader { geometry in
          CloseButton().frame(
            width: Constant.closeButtonSize.width,
            height: Constant.closeButtonSize.height
          ).offset(
            CGSize(
              width: geometry.size.width - Constant.closeButtonSize.width - 20.0, 
              height: -Constant.closeButtonSize.height * 0.5 + 7.94
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
  private func maketitleLabel() -> some View {
    Text(Constant.pageTitle)
      .font(
        .system(
          size: 36,
          weight: .bold,
          design: .default
        )
      )
      .lineSpacing(46.8 - 36.0)
      .multilineTextAlignment(.center)
  }
    

  private func makeGraphWithProttyView() -> some View {
    BarGraphView().background {
      GeometryReader { geometry in
        Image("Protty")
          .aspectRatio(contentMode: .fit)
          .frame(width: 187.72, height: 170.0)
          .offset(Constant.prottyOffsetFromGraph)
      }
    }
  }

  private func makePromoTextView() -> some View {
    return VStack {
      Text(Constant.levelUpText)
        .font(Font(UIFont(name: "HiraginoSans-W6", size: 20.0)!))
        .kerning(-0.57)
        .lineSpacing(15)
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity, alignment: .center)
      Text(Constant.speakBuddyText).modifier(SpeakBuddy.GradientTextModifier())
    }
  }
  
  private func makeSubscribeButton() -> some View {
    return Button {
      vibrateForSubscribeButtonTap()
    } label: {
      Text(Constant.subscribeButtonTitle)
    }.buttonStyle(
      SpeakBuddy.ThemeButtonStyle()
    ).shadow(
      color: Color.fromRGBA256Color(
        red: 0,
        green: 0,
        blue: 0,
        alpha: 0.2
      ),
      radius: 10.0, x: 0.0, y: 2.0)
    .padding(.horizontal)
  }
  
  private func makeGradientView() -> some View {
    return LinearGradient(
      colors: [
        Color.fromRGBA256Color(red: 213, green: 210, blue: 255, alpha: 1.0),
        Color.fromRGBA256Color(red: 255, green: 255, blue: 255, alpha: 1.0)
      ],
      startPoint: .top,
      endPoint: .bottom
    )
  }
  
  private func vibrateForSubscribeButtonTap() {
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .soft)
    feedbackGenerator.impactOccurred()
  }
}

#Preview {
  SubscribePlanPromptView(
    viewModel: SubscribePlanPromptViewModel()
  )
}
