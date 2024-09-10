//
//  SubscribePlanPromptViewModelTests.swift
//  HelloSpeakBuddyTests
//
//  Created by Vijaychandran Jayachandran on 1/9/24.
//

import XCTest
import Combine
@testable import HelloSpeakBuddy

final class SubscribePlanPromptViewModelTests: XCTestCase {
  private var sut: SubscribePlanPromptViewModel!
  private var output: SubscribePlanPromptViewModel.Output!
  private var cancellables: Set<AnyCancellable>!
  private var viewDidAppear: PassthroughSubject<Void, Never>!
  private var subscribeButtonTapPublisher: PassthroughSubject<Void, Never>!
  private var closeButtonTapPublisher: PassthroughSubject<Void, Never>!
  
  override func setUp() {
    super.setUp()
    cancellables = Set<AnyCancellable>()
    viewDidAppear = PassthroughSubject<Void, Never>()
    subscribeButtonTapPublisher = PassthroughSubject<Void, Never>()
    closeButtonTapPublisher = PassthroughSubject<Void, Never>()
    
    sut = SubscribePlanPromptViewModel()
    
    let input = SubscribePlanPromptViewModel.Input(
      viewDidAppear: viewDidAppear.eraseToAnyPublisher(),
      subscribeButtonTapPublisher: subscribeButtonTapPublisher.eraseToAnyPublisher(),
      closeButtonTapPublisher: closeButtonTapPublisher.eraseToAnyPublisher()
    )
    
    output = sut.transform(input: input)
    output.combinedPublishers.sink { _ in
      
    }.store(in: &cancellables)
  }
  
  override func tearDown() {
    super.tearDown()
    sut = nil
  }
  
  func testOnAppear_graphIsShown() {
    // given
    let expectation = expectation(description: "graph is shown expectation")
    output.showGraphPublisher.sink { _ in
      // then
      expectation.fulfill()
    }.store(in: &cancellables)
    // when
    viewDidAppear.send()
    wait(for: [expectation], timeout: 2.0)
  }
  
  func testSubscribeButtonTap_pageLoadingIndicatorIsShown() {
    // given
    let expectation = expectation(description: "page loading indicator is shown expectation")
    output.loadingPublisher.sink { isLoading in
      // then
      XCTAssertTrue(isLoading)
      expectation.fulfill()
    }.store(in: &cancellables)
    // when
    subscribeButtonTapPublisher.send()
    wait(for: [expectation], timeout: 2.0)
  }
  
  func testCloseButtonTap_pageIsDismissed() {
    // given
    let expectation = expectation(description: "page loading indicator is shown expectation")
    output.dismissPublisher.sink { output in
      // then
      expectation.fulfill()
    }.store(in: &cancellables)
    // when
    closeButtonTapPublisher.send()
    wait(for: [expectation], timeout: 2.0)
  }
}
