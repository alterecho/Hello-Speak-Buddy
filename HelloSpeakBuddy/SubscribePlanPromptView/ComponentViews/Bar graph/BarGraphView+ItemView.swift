//
//  File.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 6/9/24.
//

import SwiftUI

extension BarGraphView {
  // Individual bars in BarGraphView
  struct ItemView: View {
    enum Constant {
      static let verticalSpacing = 7.0
      static let gradientStart = Color.fromRGBA256Color(
        red: 31,
        green: 143,
        blue: 255,
        alpha: 1.0
      )
      
      static let gradientEnd = Color.fromRGBA256Color(
        red: 88,
        green: 192,
        blue: 255,
        alpha: 1.0
      )
      
      static let labelSize = CGSize(
        width: 42.8,
        height: 18.0
      )
    }
    
    // Model for the bar
    struct Model {
      let label: String
      let value: Int
    }
    
    private var model: Model
    private var delay: TimeInterval
    
    init(model: Model, delay: TimeInterval) {
      self.model = model
      self.delay = delay
    }
    
    @State private var heightFactor = 0.0
    
    var body: some View {
      VStack(spacing: Constant.verticalSpacing) {
        GeometryReader { geometry in
          VStack {
            Spacer()
            Rectangle().fill(
              LinearGradient(
                colors: [
                  Constant.gradientStart,
                  Constant.gradientEnd
                ],
                startPoint: .top,
                endPoint: .bottom
              )
            ).frame(
              height: geometry.size.height * Double(model.value) / 100.0 * heightFactor
            ).scaleEffect(
              x: 1,
              y: -1,
              anchor: .center
            ).cornerRadius(2.73)
          }
        }
        Text(model.label)
          .font(
            Font(
              UIFont(
                name: "HiraginoSans-W6",
                size: 12.0)!
            )
          ).frame(
            width: Constant.labelSize.width.screenScaled,
            height: Constant.labelSize.width.screenScaled,
            alignment: .center
          ).clipped()
      }.onAppear {
        withAnimation(.easeOut(duration: 0.625).delay(delay)) {
          heightFactor = 1.0
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
