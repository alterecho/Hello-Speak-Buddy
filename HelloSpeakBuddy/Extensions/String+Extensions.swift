//
//  String+Extensions.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 24/9/24.
//

import SwiftUI

extension String: ColorIdentifiable {
  var color: Color {
    Color(self)
  }
}

extension String: Localizable {
  var localized: LocalizedStringKey {
    LocalizedStringKey(self)
  }
}
