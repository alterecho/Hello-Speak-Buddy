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
    var showGraphPublisher: AnyPublisher<Void, Never>
    var loadingPublisher: AnyPublisher<Bool, Never>
    var dismissPublisher: AnyPublisher<Void, Never>
    var combinedPublishers: AnyPublisher<Void, Never>
  }
  
  private let showGraphSubject = PassthroughSubject<Void, Never>()
  private let loadingSubject = PassthroughSubject<Bool, Never>()
  private let dismissSubject = PassthroughSubject<Void, Never>()
          
  func transform(input: Input) -> Output {
    let viewDidAppearPublisher = input.viewDidAppear.handleEvents(
      receiveOutput: { [weak self] _ in
        self?.showGraphSubject.send()
      })
    
    let subscribeButtonTapPublisher = input.subscribeButtonTapPublisher.handleEvents(
      receiveOutput: { [weak self] _ in
        self?.loadingSubject.send(true)
      })
    
    let closeButtonTapPublisher =  input.closeButtonTapPublisher.handleEvents(
      receiveOutput: { [weak self] _ in
        self?.dismissSubject.send()
      })
    
    let combinedPublishers = Publishers.CombineLatest3(
      viewDidAppearPublisher,
      subscribeButtonTapPublisher,
      closeButtonTapPublisher
    ).flatMap { _ in
      Just(())
    }
    
    return Output(
      showGraphPublisher: showGraphSubject.eraseToAnyPublisher(),
      loadingPublisher: loadingSubject.eraseToAnyPublisher(),
      dismissPublisher: dismissSubject.eraseToAnyPublisher(),
      combinedPublishers: combinedPublishers.eraseToAnyPublisher()
    )
  }
}
