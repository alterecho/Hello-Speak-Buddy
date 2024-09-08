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
    GeometryReader { geometry in
      let scale = calculateDesignScale(forSize: UIScreen.main.bounds.size)
      let scaleWidth = calculateDesignScaleReferingWidth(forSize: UIScreen.main.bounds.size)
      let scaleHeight = calculateDesignScaleReferingHeight(forSize: UIScreen.main.bounds.size)
      let barWidth = Constant.barWidth * scaleWidth
      print(barWidth)
      return VStack {
        HStack(
          alignment: .bottom,
          spacing: Constant.barSpacing * scale
        ) {
          ForEach(Array(Constant.itemModels.enumerated()), id: \.element.label) { enumeration in
            Self.ItemView(
              model: enumeration.element,
              delay: TimeInterval(Double(enumeration.offset) * 0.125)
            ).frame(width: barWidth)
          }
        }
      }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
    }
    
  }
}

#Preview {
  SubscribePlanPromptView(
    viewModel: SubscribePlanPromptViewModel()
  )
}
