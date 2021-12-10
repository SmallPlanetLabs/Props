//
//  CircleStepProgressStyle.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/3/21.
//

import SwiftUI

public struct CircleStepProgressStyle: ProgressViewStyle {
    public init(total: Int) {
        self.total = total
    }
    
    let total: Int
    public func makeBody(configuration: Configuration) -> some View {
        DeterminateView(configuration: configuration, total: total)
    }

    struct DeterminateView: View {
        @Environment(\.primaryColor) var primaryColor: Color
        let configuration: Configuration
        let total: Int
        var fraction: Double { configuration.fractionCompleted ?? 0 }
        var currentStep: Int { Int(Double(total) * fraction) }
        let height = CGFloat(3)
        let diameter = CGFloat(50)

        var body: some View {
            GeometryReader { proxy in
                ZStack {
                    Rectangle()
                        .fill(primaryColor)
                        .frame(height: height)

                    ForEach(0..<total) { index in
                        Circle()
                            .fill(index == currentStep ? primaryColor : Color.white)
                            .frame(width: diameter, height: diameter)
                            .offset(x: offset(width: proxy.size.width, index: index))

                        Circle()
                            .stroke(primaryColor, style: StrokeStyle(lineWidth: height))
                            .frame(width: diameter, height: diameter)
                            .overlay(label(index: index))
                            .offset(x: offset(width: proxy.size.width, index: index))
                    }
                }
            }
            .frame(height: diameter + 20)
        }

        func label(index: Int) -> some View {
            Group {
                if currentStep == index {
                    Text("\(index)").foregroundColor(.white)
                } else if currentStep > index {
                    Image(systemName: "checkmark").font(.title.bold()).foregroundColor(primaryColor)
                } else {
                    Text("\(index)").foregroundColor(primaryColor)
                }
            }
        }

        func offset(width: CGFloat, index: Int) -> CGFloat {
            (width - diameter) / CGFloat(total - 1) * CGFloat(index) + (diameter - width) / 2
        }
    }

    struct ClipShape: Shape {
        var pct: Double

        var animatableData: Double {
            get { pct }
            set { pct = newValue }
        }

        func path(in rect: CGRect) -> Path {
            Path(CGRect(origin: .zero, size: CGSize(width: rect.size.width * CGFloat(pct), height: rect.size.height)))
        }
    }
}

struct CircleStepProgressStyle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView("How's it going?", value: 1, total: 3)
            .progressViewStyle(CircleStepProgressStyle(total: 3))
            .padding()
    }
}
