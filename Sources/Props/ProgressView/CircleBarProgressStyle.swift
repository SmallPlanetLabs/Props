//
//  CircleBarProgressStyle.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI

public struct CircleBarProgressStyle: ProgressViewStyle {
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        Group {
            if configuration.fractionCompleted == nil {
                IndeterminateView(configuration: configuration)
            } else {
                DeterminateView(configuration: configuration)
            }
        }
    }

    struct IndeterminateView: View {
        @State private var rotation = Angle(degrees: 0)
        let configuration: Configuration

        var body: some View {
            VStack {
                Image(systemName: "stopwatch")
                    .font(.largeTitle)
                    .rotationEffect(rotation)
                    .onAppear {
                        withAnimation(Animation.linear(duration: 2.0).repeatForever(autoreverses: false)) {
                            self.rotation = Angle(degrees: 360)
                        }
                    }
                configuration.currentValueLabel
                configuration.label
            }
        }
    }

    struct DeterminateView: View {
        @Environment(\.primaryColor) var primaryColor: Color
        @Environment(\.secondaryColor) var secondaryColor: Color
        let configuration: Configuration
        var fraction: Double { configuration.fractionCompleted ?? 0 }
        let height = CGFloat(3)
        let diameter = CGFloat(50)

        var body: some View {
            GeometryReader { proxy in
                ZStack {
                    Rectangle()
                        .fill(secondaryColor)
                        .frame(height: height)

                    Rectangle()
                        .fill(primaryColor)
                        .frame(height: height)
                        .clipShape(ClipShape(pct: fraction))

                    Circle()
                        .fill(Color.white)
                        .frame(width: diameter, height: diameter)
                        .offset(x: (proxy.size.width - diameter) * (fraction - 0.5))

                    Circle()
                        .stroke(primaryColor, style: StrokeStyle(lineWidth: height))
                        .frame(width: diameter, height: diameter)
                        .overlay(label)
                        .offset(x: (proxy.size.width - diameter) * (fraction - 0.5))
                }
                .animation(.spring(), value: fraction)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
            }
            .frame(height: diameter + 20)
        }

        @ViewBuilder var label: some View {
            Text(String(format: "%.0f", fraction * 100))
                .foregroundColor(primaryColor)
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

struct CircleBarProgress_Previews: PreviewProvider {
    static var progress: Foundation.Progress = {
        let progress = Foundation.Progress(totalUnitCount: 20)
        progress.completedUnitCount = 11
        return progress
    }()
    static var previews: some View {
        ProgressView(progress)
            .progressViewStyle(CircleBarProgressStyle())
            .padding()
    }
}
