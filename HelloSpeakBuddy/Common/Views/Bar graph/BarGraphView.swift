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
        label: "barLabel1",
        value: 25
      ),
      BarGraphView.ItemView.Model(
        label: "barLabel2",
        value: 38
      ),
      BarGraphView.ItemView.Model(
        label: "barLabel3",
        value: 70
      ),
      BarGraphView.ItemView.Model(
        label: "barLabel4",
        value: 95
      )
    ]
    
    static let barSpacing: CGFloat = 26.0
    static let barWidth: CGFloat = 48.0
  }
  
  var body: some View {
      HStack(
        alignment: .bottom,
        spacing: Constant.barSpacing.screenScaled
      ) {
        ForEach(Array(Constant.itemModels.enumerated()), id: \.element.label) { enumeration in
          Self.ItemView(
            model: enumeration.element,
            delay: TimeInterval(
              Double(enumeration.offset) * 0.125
            )
          )
          .frame(width: Constant.barWidth.screenScaled)
        }
      }
  }
}

#Preview {
  SubscribePlanPromptView(
    viewModel: SubscribePlanPromptViewModel()
  )
}
