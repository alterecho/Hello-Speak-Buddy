//
//  WelcomeScreenView.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 10/9/24.
//

import SwiftUI

struct WelcomeScreenView: View {
  @State private var showSubscribeViewModally: Bool = false
  
  var body: some View {
    VStack {
      Button {
        showSubscribeViewModally = true
      } label: {
        Text("launch")
      }
    }.sheet(isPresented: $showSubscribeViewModally) {
      SubscribePlanPromptView(
        viewModel: SubscribePlanPromptViewModel(),
        isModalPresentationBinding: $showSubscribeViewModally
      )
    }
  }
}

#Preview {
  WelcomeScreenView()
}
