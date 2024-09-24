//
//  WelcomeScreenView.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 10/9/24.
//

import SwiftUI

struct WelcomeScreenView: View {
  @State private var showSubscribeViewWithNavigationStack: Bool = false
  @State private var showSubscribeViewModally: Bool = false
  @State private var showSubscribeViewAsFullScreenCover: Bool = false
  
  var body: some View {
    makeViewByAddingNavigation(
      view: makeContentView()
    )
  }
}

extension WelcomeScreenView {
  private enum Constant {
    static let chooseSubscribeNavigationStyleTextIdentifier = "chooseSubscribeNavigationStyle"
    static let navigationToSubscribeScreenTextIdentifier = "navigationToSubscribeScreen"
    static let showSubscribePopupTextIdentifier = "showSubscribePopup"
    static let showSubscribeFullscreenTextIdentifier = "showSubscribeFullscreen"
  }
}

extension WelcomeScreenView {
  private func makeContentView() -> some View {
    ZStack {
      GradientBackground()
      VStack(spacing: 10.0) {
        Text(Constant.chooseSubscribeNavigationStyleTextIdentifier.localized)
          .font(.title2)
          .multilineTextAlignment(.center)
        
        Button {
          showSubscribeViewWithNavigationStack = true
        } label: {
          Text(Constant.navigationToSubscribeScreenTextIdentifier.localized)
            .font(.title)
        }
        
        Button {
          showSubscribeViewModally = true
        } label: {
          Text(Constant.showSubscribePopupTextIdentifier.localized)
            .font(.title)
        }
        Button {
          showSubscribeViewAsFullScreenCover = true
        } label: {
          Text(Constant.showSubscribeFullscreenTextIdentifier.localized)
            .font(.title)
        }
      }.padding()
    }
    .ignoresSafeArea()
  }
  
  private func makeViewByAddingNavigation(view: some View) -> some View {
    NavigationStack {
      view
        .navigationDestination(
          isPresented: $showSubscribeViewWithNavigationStack,
          destination: {
            makeSubscribePlanPromptView(
              presentationBinding: $showSubscribeViewWithNavigationStack
            )
          }
        )
        .sheet(
          isPresented: $showSubscribeViewModally
        ) {
          makeSubscribePlanPromptView(
            presentationBinding: $showSubscribeViewModally
          )
        }.fullScreenCover(
          isPresented: $showSubscribeViewAsFullScreenCover
        ) {
          makeSubscribePlanPromptView(
            presentationBinding: $showSubscribeViewAsFullScreenCover
          )
        }
    }
  }
  
  private func makeSubscribePlanPromptView(
    presentationBinding: Binding<Bool>? = nil
  ) -> SubscribePlanPromptView{
    return SubscribePlanPromptView(
      viewModel: SubscribePlanPromptViewModel(),
      isModalPresentationBinding: presentationBinding
    )
  }
}

#Preview {
  WelcomeScreenView()
}
