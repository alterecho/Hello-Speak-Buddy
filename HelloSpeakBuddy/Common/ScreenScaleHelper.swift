//
//  ScreenScaleHelper.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 12/9/24.
//

import Foundation

/// Provides methods to calculate dimensions, using
/// iPhone 15 screen size as reference, as indicated on Figma.
struct ScreenScaleHelper {
  private enum Constant {
    /// iPhone 15 screen size
    static let referenceSize = CGSize(
      width: 390.0,
      height: 844.0
    )
  }
  
  static func calculateDesignScaleReferingWidth(
    forSize size: CGSize,
    referenceSize: CGSize = Constant.referenceSize
  ) -> CGFloat {
    size.width / referenceSize.height
  }

  static func calculateDesignScaleReferingHeight(
    forSize size: CGSize,
    referenceSize: CGSize = Constant.referenceSize
  ) -> CGFloat {
    size.height / referenceSize.height
  }

  static func calculateDesignScale(
    forSize size: CGSize,
    referenceSize: CGSize = Constant.referenceSize
  ) -> CGFloat {
    if size.width > size.height {
      return calculateDesignScaleReferingWidth(
        forSize: size,
        referenceSize: referenceSize
      )
    } else {
      return calculateDesignScaleReferingHeight(
        forSize: size,
        referenceSize: referenceSize
      )
    }
  }

}
