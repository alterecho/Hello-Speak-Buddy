//
//  ScreenScalable.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 6/9/24.
//

import UIKit
import SwiftUI

private let referenceSize = CGSize(
  width: 390.0,
  height: 844.0
)

protocol ScreenScalable {
  var screenScaled: Self { get }
}

extension Double {
  var widthScaled: Self {
    let screenSize = UIScreen.main.bounds.size
    return screenSize.width / referenceSize.width * self
  }
  
  var heightScaled: Self {
    let screenSize = UIScreen.main.bounds.size
    return screenSize.height / referenceSize.height * self
  }
}

extension CGFloat {
  var widthScaled: Self {
    return Double(self).widthScaled
  }
  
  var heightScaled: Self {
    return Double(self).heightScaled
  }
}


extension Int {
  var widthScaled: Self {
    return Int(Double(self).widthScaled)
  }
  
  var heightScaled: Self {
    return Int(Double(self).heightScaled)
  }
}

extension CGSize: ScreenScalable {
  var screenScaled: Self {
    return CGSize(
      width: Double(width).widthScaled,
      height: Double(height).heightScaled
    )
  }
}

extension UIEdgeInsets: ScreenScalable {
  var screenScaled: Self {
    return UIEdgeInsets(
      top: Double(top).heightScaled,
      left: Double(left).widthScaled,
      bottom: Double(bottom).heightScaled,
      right: Double(right).widthScaled
    )
  }
}

extension EdgeInsets: ScreenScalable {
  var screenScaled: Self {
    return EdgeInsets(
      top: Double(top).heightScaled,
      leading: Double(leading).widthScaled,
      bottom: Double(bottom).heightScaled,
      trailing: Double(trailing).widthScaled
    )
  }
}
