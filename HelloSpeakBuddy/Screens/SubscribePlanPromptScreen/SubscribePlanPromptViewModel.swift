//
//  SubscribePlanPromptViewModel.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 31/8/24.
//

import Combine
import SwiftUI

class SubscribePlanPromptViewModel: ObservableObject {
  struct Input {
    let viewDidAppear: AnyPublisher<Void, Never>
    let subscribeButtonTapPublisher: AnyPublisher<Void, Never>
    let closeButtonTapPublisher: AnyPublisher<Void, Never>
  }
  
  struct Output {
    var showGraph: Bool
    var loading: Bool
    var dismiss: Bool
  }
  
  private var cancellables = Set<AnyCancellable>()
    
  @Published var output: Output = {
    return Output(
      showGraph: false,
      loading: false,
      dismiss: false
    )
  }()
    
  func transform(input: Input) {
    input.viewDidAppear.sink { [weak self] _ in
      self?.output.showGraph = true
    }.store(in: &cancellables)

    input.subscribeButtonTapPublisher.sink { [weak self] _ in
      self?.output.loading = true
    }.store(in: &cancellables)
    
    input.closeButtonTapPublisher.sink { [weak self] _ in
      self?.output.dismiss = true
    }.store(in: &cancellables)

  }
}
