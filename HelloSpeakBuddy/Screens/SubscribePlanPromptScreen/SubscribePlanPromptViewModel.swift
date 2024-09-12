//
//  SubscribePlanPromptViewModel.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 31/8/24.
//

import Combine
import SwiftUI

/// Viewmodel uses Input/Output pattern
/// reference https://medium.com/@mshcheglov/mvvm-design-pattern-with-combine-framework-on-ios-5ff911011b0b
class SubscribePlanPromptViewModel: ObservableObject {
  struct Input {
    let viewDidAppear: AnyPublisher<Void, Never>
    let subscribeButtonTapPublisher: AnyPublisher<Void, Never>
    let closeButtonTapPublisher: AnyPublisher<Void, Never>
    var isModalPresentationBinding: Binding<Bool>
  }
  
  struct Output {
    var showGraph: Bool
    var loading: Bool
    var isModalPresentationBinding: Binding<Bool>
  }
  
  private var cancellables = Set<AnyCancellable>()
    
  @Published var output: Output = Output(
    showGraph: false,
    loading: false,
    isModalPresentationBinding: .constant(false)
  )
    
  func transform(input: Input) {
    output = Output(
      showGraph: false,
      loading: false,
      isModalPresentationBinding: input.isModalPresentationBinding
    )
    input.viewDidAppear.sink { [weak self] _ in
      self?.output.showGraph = true
    }.store(in: &cancellables)

    input.subscribeButtonTapPublisher.sink { [weak self] _ in
      self?.output.loading = true
    }.store(in: &cancellables)
    
    input.closeButtonTapPublisher.sink { [weak self] _ in
      guard let self else {
        return
      }
      output.isModalPresentationBinding.wrappedValue = false      
    }.store(in: &cancellables)
  }
}
