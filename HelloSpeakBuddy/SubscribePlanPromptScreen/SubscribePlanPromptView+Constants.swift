//
//  SubscribePlanPromptView+Constants.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 5/9/24.
//

import SwiftUI

extension SubscribePlanPromptView {
  enum Constant {    
    static let titleLabelFontSize = 36.0
    static let levelUpTextFontSize = 20.0
    
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
      bottom: 0.0,
      trailing: 20.33
    )

    static let closeButtonSize = CGSize(
      width: 38.0,
      height: 38.0
    )
    
    static let prottyOffsetFromGraph = CGSize(
      width: -37.52,
      height: -52.15
    )
    
    static let graphPadding = EdgeInsets(
      top: 0.0,
      leading: 60.0,
      bottom: 0.0,
      trailing: 60.0
    )
      
    static let prottyImageSize = CGSize(
      width: 187.72,
      height: 170.0
    )

    static let subscribeButtonPadding = EdgeInsets(
      top: 0.0,
      leading: 20.0,
      bottom: 0.0,
      trailing: 20.0
    )
    
    static let title_ProttySpacing = 32.85
    static let graph_PromoLabelSpacing = 30.0
    static let promoLabel_ButtonSpacing = 25.0
  }
}

#Preview {
  SubscribePlanPromptView(
    viewModel: SubscribePlanPromptViewModel()
  )
}

