//
//  SubscribePlanPromptView+Constants.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 5/9/24.
//

import SwiftUI

/// for all the constants used in this view
extension SubscribePlanPromptView {
  enum Constant {    
    static let titleLabelFontSize = 36.0
    static let titleLabelTextColorIdentifier = "titleLabelText"

    static let levelUpTextFontSize = 20.0
    static let graphSize = CGSize(width: 270.0, height: 325.0)
    static let subscribeButtonShadowColorIdentifier = "subscribeButtonShadow"
        
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

    static let subscribeButtonSize = CGSize(
      width: 350.0,
      height: 56.0
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

