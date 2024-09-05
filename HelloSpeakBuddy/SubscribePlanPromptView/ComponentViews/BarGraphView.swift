//
//  Graph.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 5/9/24.
//

import SwiftUI

struct BarGraphView: View {
  var body: some View {
    HStack(alignment: .bottom, spacing: 26.0) {
      let itemModels = [
        Self.ItemView.Model(label: "現在", value: 25),
        Self.ItemView.Model(label: "3ヶ月", value: 38),
        Self.ItemView.Model(label: "1年", value: 70),
        Self.ItemView.Model(label: "2年", value: 100)
      ]
      ForEach(Array(itemModels.enumerated()), id: \.element.label) { enumeration in
        Self.ItemView(
          model: enumeration.element,
          delay: TimeInterval(Double(enumeration.offset) * 0.25)
        ).frame(width: 48.0)
      }
    }
  }
}


extension BarGraphView {
  // Individual bars in BarGraphView
  fileprivate struct ItemView: View {
    // Model for the bar
    fileprivate struct Model {
      let label: String
      let value: Int
    }
    
    private var model: Model
    private var delay: TimeInterval
    
    init(model: Model, delay: TimeInterval) {
      self.model = model
      self.delay = delay
    }
    
    @State var heightFactor = 0.0
    var body: some View {
      VStack(spacing: 7.0) {
        GeometryReader { geometry in
          VStack {
            Spacer()
            Rectangle().fill(
              LinearGradient(
                colors: [
                  Color.fromRGBA256Color(red: 31, green: 143, blue: 255, alpha: 1.0),
                  Color.fromRGBA256Color(red: 88, green: 192, blue: 255, alpha: 1.0)
                ],
                startPoint: .top,
                endPoint: .bottom
              )
            ).frame(
              height: geometry.size.height * Double(model.value) / 100.0 * heightFactor
            ).scaleEffect(x: 1, y: -1, anchor: .center).cornerRadius(2.73)
          }
        }
        Spacer().frame(height: 7.0)
        Text(model.label)
          .font(
            Font(
              UIFont(
                name: "HiraginoSans-W6",
                size: 12.0)!
            )
          ).lineSpacing(15)
      }.onAppear {
        withAnimation(.easeOut(duration: 0.75).delay(delay)) {
          heightFactor = 1.0
        }
      }
    }
  }
}
