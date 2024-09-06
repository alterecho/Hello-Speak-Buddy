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

extension Double: ScreenScalable {
  var screenScaled: Self {
    let screenSize = UIScreen.main.bounds.size
    return screenSize.width / referenceSize.width
  }
}

extension CGFloat: ScreenScalable {
  var screenScaled: Self {
    return Double(self).screenScaled
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
