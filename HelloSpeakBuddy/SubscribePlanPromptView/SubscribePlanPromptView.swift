//
//  SubscribePlanPromptView.swift
//  HelloSpeakBuddy
//
//  Created by Vijaychandran Jayachandran on 31/8/24.
//

import SwiftUI
import Combine

struct SubscribePlanPromptView: View {
  private enum Constant {
    static let closeButtonSize = CGSize(
      width: 38.0,
      height: 38.0
    )
  }
  
  @State var viewModel: SubscribePlanPromptViewModel
  let button = Button {
    
  } label: {
    Text("Subscribe")
  }
  
  private var viewDidAppearSubject = PassthroughSubject<Void, Never>()
  private var signupButtonTapSubject = PassthroughSubject<Void, Never>()

  init(viewModel: SubscribePlanPromptViewModel) {
    self.viewModel = viewModel
    viewModel.transform(
      input: SubscribePlanPromptViewModel.Input(
        viewDidAppear: viewDidAppearSubject.eraseToAnyPublisher(),
        subscribeButtonTapPublisher: signupButtonTapSubject.eraseToAnyPublisher()))
  }

  var body: some View {
    ZStack {
      makeGradientView().ignoresSafeArea()
      VStack {
        maketitleLabel()
        Spacer().frame(height: 85.0)
        makeGraphWithProttyView().frame(width: 270.0, height: 325.0)
        Spacer().frame(height: 30.0)
        makePromoTextView().opacity(0.8)
        Spacer().frame(height: 25.0)
        makeSubscribeButton()
          .edgesIgnoringSafeArea([.leading, .trailing, .bottom])
          .padding(
            EdgeInsets(
              top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0
            )
          )
      }.overlay {
        GeometryReader { geometry in
          CloseButton().frame(
            width: Constant.closeButtonSize.width,
            height: Constant.closeButtonSize.height
          ).offset(
            CGSize(
              width: geometry.size.width - Constant.closeButtonSize.width - 20.0, 
              height: -Constant.closeButtonSize.height * 0.5 + 7.94
            )
          )
        }
      }
    }.onAppear {
      viewDidAppearSubject.send()
    }
  }
  
  var activityIndicator: some View {
    return ProgressView().progressViewStyle(.circular)
  }
  
}

extension SubscribePlanPromptView {
  private func maketitleLabel() -> some View {
    Text("Hello\nSpeakBUDDY ")
      .font(
        .system(
          size: 36,
          weight: .bold,
          design: .default
        )
      )
      .lineSpacing(46.8 - 36.0)
      .multilineTextAlignment(.center)
  }
    
  struct GraphBarItemView: View {
    struct Item {
      let value: Int
      let label: String
    }
    private var item: Item
    private var delay: TimeInterval
    
    init(item: Item, delay: TimeInterval) {
      self.item = item
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
              height: geometry.size.height * Double(item.value) / 100.0 * heightFactor
            ).scaleEffect(x: 1, y: -1, anchor: .center).cornerRadius(2.73)
          }
        }
        Spacer().frame(height: 7.0)
        Text(item.label)
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
  
  private struct Graph: View {
    var body: some View {
      HStack(alignment: .bottom, spacing: 26.0) {
        let labels = [
          GraphBarItemView.Item(value: 25, label: "現在"),
          GraphBarItemView.Item(value: 38, label: "3ヶ月"),
          GraphBarItemView.Item(value: 70, label: "1年"),
          GraphBarItemView.Item(value: 100, label: "2年")
          ]
        ForEach(Array(labels.enumerated()), id: \.element.label) { enumeration in
          GraphBarItemView(
            item: enumeration.element,
            delay: TimeInterval(Double(enumeration.offset) * 0.25)
          ).frame(width: 48.0)
        }
      }
    }
  }

  private func makeGraphWithProttyView() -> some View {
    GeometryReader { geometry in
      Graph().background {
        Image("Protty")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 187.72, height: 170.0)
          .offset(x: -geometry.size.width * 0.5 + 37.52,
                  y: -geometry.size.height * 0.5 + 52.15)
      }

    }
  }

  private func makePromoTextView() -> some View {
    return VStack {
      Text("スピークバディで")
        .font(Font(UIFont(name: "HiraginoSans-W6", size: 20.0)!))
        .kerning(-0.57)
        .lineSpacing(15)
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity, alignment: .center)

      LinearGradient(
            colors: [
              Color.fromRGBA256Color(red: 111, green: 212, blue: 255, alpha: 1.0),
              Color.fromRGBA256Color(red: 0, green: 117, blue: 255, alpha: 1.0)
            ],
            startPoint: .top,
            endPoint: .bottom
      ).frame(height: 45.0)
      .mask {
        Text("レベルアップ")
          .font(Font(UIFont(name: "HiraginoSans-W6", size: 30)!))
          .kerning(-0.57)
          .lineSpacing(15)
          .multilineTextAlignment(.center)
          .frame(maxWidth: .infinity, alignment: .center)
      }
    }
  }
  
  private func makeSubscribeButton() -> some View {
    return Button {
      vibrateForSubscribeButtonTap()
    } label: {
      Text("プランに登録する")
        .font(.headline)
        .foregroundColor(    
          .white
        )
        .padding()
        .frame(maxWidth: .infinity)
        .background(
          Color.fromRGBA256Color(red: 59, green: 167, blue: 255, alpha: 1.0)
        )
        .cornerRadius(28.66)
        .overlay {
          RoundedRectangle(cornerRadius: 28.66)
            .stroke(
              Color.fromRGBA256Color(
                red: 255,
                green: 255,
                blue: 255,
                alpha: 1.0
              ),
              lineWidth: 1.0
            )
        }
        .shadow(
          color: Color.fromRGBA256Color(
            red: 0,
            green: 0,
            blue: 0,
            alpha: 0.2
          ),
          radius: 10.0, x: 0.0, y: 2.0)
        .padding(.horizontal)
    }
  }
  
  private func makeGradientView() -> some View {
    return LinearGradient(
      colors: [
        Color.fromRGBA256Color(red: 213, green: 210, blue: 255, alpha: 1.0),
        Color.fromRGBA256Color(red: 255, green: 255, blue: 255, alpha: 1.0)
      ],
      startPoint: .top,
      endPoint: .bottom
    )
  }
  
  private func vibrateForSubscribeButtonTap() {
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .soft)
    feedbackGenerator.impactOccurred()
  }
}

#Preview {
  SubscribePlanPromptView(
    viewModel: SubscribePlanPromptViewModel()
  )
}
