//
//  Localizable.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 24/9/24.
//

import SwiftUI

/// Protocol that signifies that it denotes an identifier having the value in the strings file.
/// The localized value can be obtained using the `localized` property
protocol Localizable {
  var localized: LocalizedStringKey { get }
}
