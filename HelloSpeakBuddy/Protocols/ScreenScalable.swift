//
//  ScreenScalable.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 6/9/24.
//

import UIKit

protocol ScreenScalable {
  var screenScaled: Self { get }
}

extension ScreenScalable {
  func calculateScreenScale() -> CGFloat {
    let screenSize = UIScreen.main.bounds.size
    return ScreenScaleHelper.calculateDesignScale(forSize: screenSize)
  }
}
