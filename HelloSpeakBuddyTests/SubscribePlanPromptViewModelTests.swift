//
//  SubscribePlanPromptViewModelTests.swift
//  HelloSpeakBuddyTests
//
//  Created by Vijaychandran Jayachandran on 1/9/24.
//

import XCTest
import Combine
import SwiftUI
@testable import HelloSpeakBuddy

final class SubscribePlanPromptViewModelTests: XCTestCase {
  private var sut: SubscribePlanPromptViewModel!
  
  private var cancellables: Set<AnyCancellable>!
  private var viewDidAppear: PassthroughSubject<Void, Never>!
  private var subscribeButtonTapPublisher: PassthroughSubject<Void, Never>!
  private var closeButtonTapPublisher: PassthroughSubject<Void, Never>!
  private var isModalPresentation: Bool!
  
  override func setUp() {
    super.setUp()
    cancellables = Set<AnyCancellable>()
    viewDidAppear = PassthroughSubject<Void, Never>()
    subscribeButtonTapPublisher = PassthroughSubject<Void, Never>()
    closeButtonTapPublisher = PassthroughSubject<Void, Never>()
    isModalPresentation = false
    sut = SubscribePlanPromptViewModel()
    let binding = Binding(
      get: { [weak self] in
        self?.isModalPresentation ?? false
      }, set: { [weak self] value, _ in
        self?.isModalPresentation = value
      })
    
    let input = SubscribePlanPromptViewModel.Input(
      viewDidAppear: viewDidAppear.eraseToAnyPublisher(),
      subscribeButtonTapPublisher: subscribeButtonTapPublisher.eraseToAnyPublisher(),
      closeButtonTapPublisher: closeButtonTapPublisher.eraseToAnyPublisher(),
      isModalPresentationBinding: binding
    )
    sut.transform(input: input)
  }
  
  override func tearDown() {
    super.tearDown()
    sut = nil
  }
  
  func testOnAppear_graphIsShown() {
    // given
    let expectation = expectation(description: "graph is shown expectation")
    sut.$output.dropFirst().sink { output in
      // then
      XCTAssertTrue(output.showGraph)
      expectation.fulfill()
    }.store(in: &cancellables)
    // when
    viewDidAppear.send()
    wait(for: [expectation], timeout: 2.0)
  }
  
  func testSubscribeButtonTap_pageLoadingIndicatorIsShown() {
    // given
    let expectation = expectation(description: "page loading indicator is shown expectation")
    sut.$output.dropFirst().sink { output in
      // then
      XCTAssertTrue(output.loading)
      expectation.fulfill()
    }.store(in: &cancellables)
    // when
    subscribeButtonTapPublisher.send()
    wait(for: [expectation], timeout: 2.0)
  }
  
  func testCloseButtonTap_pageIsDismissed() {
    // given
    let expectation = expectation(description: "page loading indicator is shown expectation")
    sut.$output.dropFirst().sink { [weak self] _ in
      guard let self else {
        XCTFail()
        return
      }
      // then
      XCTAssertFalse(isModalPresentation ?? true)
      expectation.fulfill()
    }.store(in: &cancellables)
    // when
    closeButtonTapPublisher.send()
    wait(for: [expectation], timeout: 2.0)
  }
}
