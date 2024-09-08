//
//  Graph.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 5/9/24.
//

import SwiftUI

struct BarGraphView: View {
  private enum Constant {
    static let itemModels = [
      BarGraphView.ItemView.Model(
        label: "現在",
        value: 25
      ),
      BarGraphView.ItemView.Model(
        label: "3ヶ月",
        value: 38
      ),
      BarGraphView.ItemView.Model(
        label: "1年",
        value: 70
      ),
      BarGraphView.ItemView.Model(
        label: "2年",
        value: 95
      )
    ]
    
    static let barSpacing: CGFloat = 26.0
    static let barWidth: CGFloat = 48.0
  }
  
  var body: some View {
    GeometryReader { geometry in
      let scale = calculateDesignScale(forSize: UIScreen.main.bounds.size)
      HStack(
        alignment: .bottom,
        spacing: Constant.barSpacing * scale
      ) {
        ForEach(Array(Constant.itemModels.enumerated()), id: \.element.label) { enumeration in
          Self.ItemView(
            model: enumeration.element,
            delay: TimeInterval(Double(enumeration.offset) * 0.125)
          ).frame(width: Constant.barWidth * scale)
        }
      }
    }
   
  }
}

#Preview {
  SubscribePlanPromptView(
    viewModel: SubscribePlanPromptViewModel()
  )
}
