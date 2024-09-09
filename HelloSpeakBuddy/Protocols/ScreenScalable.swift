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

func calculateDesignScaleReferingWidth(
  forSize size: CGSize,
  referenceSize: CGSize = referenceSize
) -> CGFloat {
  return size.width / referenceSize.height
}

func calculateDesignScaleReferingHeight(
  forSize size: CGSize,
  referenceSize: CGSize = referenceSize
) -> CGFloat {
  return size.height / referenceSize.height
}

func calculateDesignScale(
  forSize size: CGSize,
  referenceSize: CGSize = referenceSize
) -> CGFloat {
  if size.width > size.height {
    return calculateDesignScaleReferingWidth(forSize: size)
  } else {
    return calculateDesignScaleReferingHeight(forSize: size)
  }
}

protocol ScreenScalable {
  var screenScaled: Self { get }
}

private extension ScreenScalable {
  func calculateScreenScale() -> CGFloat {
    let screenSize = UIScreen.main.bounds.size
    return calculateDesignScale(forSize: screenSize)
  }
}

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
