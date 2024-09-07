//
//  SubscribePlanPromptView+Constants.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 5/9/24.
//

import SwiftUI

extension SubscribePlanPromptView {
  enum Constant {
    static let pageTitle = "Hello\nSpeakBUDDY"
    static let levelUpText = "スピークバディで"
    static let speakBuddyText = "レベルアップ"
    static let subscribeButtonTitle = "プランに登録する"
    
    static let titleLabelFontSize = 36.0.heightScaled
    static let levelUpTextFontSize = 20.0.heightScaled
    
    static let subscribeButtonShadowColor = Color.fromRGBA256Color(
      red: 0,
      green: 0,
      blue: 0,
      alpha: 0.2
    )
    
    static let backgroundGradientStartColor = Color.fromRGBA256Color(
      red: 213,
      green: 210,
      blue: 255,
      alpha: 1.0
    )
    
    static let backgroundGradientEndColor = Color.fromRGBA256Color(
      red: 255,
      green: 255,
      blue: 255,
      alpha: 1.0
    )
    
    static let navBarInsets = EdgeInsets(
      top: 0.0,
      leading: 20.33,
      bottom: 10.0,
      trailing: 20.33
    ).screenScaled

    static let closeButtonSize = CGSize(
      width: 38.0,
      height: 38.0
    ) // not scaled as it would be too small
    
    static let prottyOffsetFromGraph = CGSize(
      width: -37.52,
      height: -52.15
    ).screenScaled
    
    static let graphSize = CGSize(
      width: 270.0,
      height: 325.0
    ).screenScaled
    
    static let prottyImageSize = CGSize(
      width: 187.72,
      height: 170.0
    ).screenScaled

    static let subscribeButtonPadding = EdgeInsets(
      top: 0.0,
      leading: 20.0,
      bottom: 0.0,
      trailing: 20.0
    ).screenScaled
  }
}
