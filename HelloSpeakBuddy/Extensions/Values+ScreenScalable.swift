//
//  Values+ScreenScalable.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 12/9/24.
//

import UIKit
import SwiftUI

/*  This file contains ScreenScalable extensions to values (Dimensions, vectors...) */
 
extension Double: ScreenScalable {
  var screenScaled: Double {
    calculateScreenScale() * self
  }
}

extension CGFloat: ScreenScalable {
  var screenScaled: CGFloat {
    return Double(self).screenScaled
  }
}


extension Int {
  var widthScaled: Self {
    return Int(Double(self).screenScaled)
  }
  
  var heightScaled: Self {
    return Int(Double(self).screenScaled)
  }
}

extension CGSize: ScreenScalable {
  var screenScaled: Self {
    return CGSize(
      width: Double(width).screenScaled,
      height: Double(height).screenScaled
    )
  }
}

extension UIEdgeInsets: ScreenScalable {
  var screenScaled: Self {
    return UIEdgeInsets(
      top: Double(top).screenScaled,
      left: Double(left).screenScaled,
      bottom: Double(bottom).screenScaled,
      right: Double(right).screenScaled
    )
  }
}

extension EdgeInsets: ScreenScalable {
  var screenScaled: Self {
    return EdgeInsets(
      top: Double(top).screenScaled,
      leading: Double(leading).screenScaled,
      bottom: Double(bottom).screenScaled,
      trailing: Double(trailing).screenScaled
    )
  }
}

#Preview {
  SubscribePlanPromptView(
    viewModel: SubscribePlanPromptViewModel()
  )
}
