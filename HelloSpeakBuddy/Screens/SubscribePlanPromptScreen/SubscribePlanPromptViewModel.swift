//
//  SubscribePlanPromptViewModel.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 31/8/24.
//

import Combine
import SwiftUI
import OpenAI

/// Viewmodel uses Input/Output pattern
/// reference https://medium.com/@mshcheglov/mvvm-design-pattern-with-combine-framework-on-ios-5ff911011b0b
class SubscribePlanPromptViewModel: ObservableObject {
  enum Constant {
    static let openAIKey =  "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"
  }
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
  
  struct CompletionsResult: Codable, Equatable {
//    static func == (lhs: SubscribePlanPromptViewModel.CompletionsResult, rhs: SubscribePlanPromptViewModel.CompletionsResult) -> Bool {
//      return true
//    }
    
      public struct Choice: Codable, Equatable {
          public let text: String
          public let index: Int
      }

      public let id: String
      public let object: String
      public let created: TimeInterval
      public let model: Model
      public let choices: [Choice]
//      public let usage: Usage
  }
  
  
  let openAI: OpenAI
  init() {
    let configuration = OpenAI.Configuration(
      token: Constant.openAIKey,
      timeoutInterval: 60.0
    )
    openAI = OpenAI(configuration: configuration)
  }
    
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
      
      let query = CompletionsQuery(
        model: .gpt3_5Turbo,
        prompt: "What is 42?",
        temperature: 0,
        maxTokens: 100,
        topP: 1,
        frequencyPenalty: 0,
        presencePenalty: 0,
        stop: ["\\n"],
        user: ""
      )
      self?.openAI.completions(query: query) { result in
        //Handle result here
      }
      //or
//      do {
//        let result = try? await openAI.completions(query: query)
//      } catch {
//
    }.store(in: &cancellables)
    
    input.closeButtonTapPublisher.sink { [weak self] _ in
      guard let self else {
        return
      }
      output.isModalPresentationBinding.wrappedValue = false      
    }.store(in: &cancellables)
  }
}
