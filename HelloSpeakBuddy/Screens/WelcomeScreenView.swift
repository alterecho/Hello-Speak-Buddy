//
//  WelcomeScreenView.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 10/9/24.
//

import SwiftUI

struct WelcomeScreenView: View {
  @State private var showSubscribeViewModally: Bool = false
  @State private var showSubscribeViewAsFullScreenCover: Bool = false
  
  var body: some View {
    VStack(spacing: 10.0) {
      Button {
        showSubscribeViewModally = true
      } label: {
        Text("showSubscribePopup")
      }
      
      Button {
        showSubscribeViewAsFullScreenCover = true
      } label: {
        Text("showSubscribeFullscreen")
      }
    }.sheet(
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
  
  private func makeSubscribePlanPromptView(
    presentationBinding: Binding<Bool>
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
