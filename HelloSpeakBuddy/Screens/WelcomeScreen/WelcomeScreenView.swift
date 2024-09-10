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
  private func makeContentView() -> some View {
    ZStack {
      GradientBackground()
      VStack(spacing: 10.0) {
        Text("chooseSubscribeNavigationStyle")
          .font(.title2)
        
        Button {
          showSubscribeViewWithNavigationStack = true
        } label: {
          Text("navigationToSubscribeScreen")
            .font(.title)
        }
        
        Button {
          showSubscribeViewModally = true
        } label: {
          Text("showSubscribePopup")
            .font(.title)
        }
        Button {
          showSubscribeViewAsFullScreenCover = true
        } label: {
          Text("showSubscribeFullscreen")
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
