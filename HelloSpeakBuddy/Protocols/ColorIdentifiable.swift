//
//  ColorIdentifiable.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 24/9/24.
//

import SwiftUI

/// Protocol that signifies that it denotes color, and the color can be obtained from the `color` method
protocol ColorIdentifiable {
  var color: Color { get }
}
