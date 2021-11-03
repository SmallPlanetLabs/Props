//
//  CircleBarProgressStyle.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI

struct CircleBarProgressStyle: ProgressViewStyle {

    func makeBody(configuration: Configuration) -> some View {
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
        let configuration: Configuration
        var fraction: Double { configuration.fractionCompleted ?? 0 }
        let height = CGFloat(3)
        let diameter = CGFloat(50)

        var body: some View {
            GeometryReader { proxy in
                ZStack {
                    Rectangle()
                        .fill(Color.accentColor.tinted(amount: 0.8))
                        .frame(height: height)

                    Rectangle()
                        .fill(Color.accentColor)
                        .frame(height: height)
                        .clipShape(ClipShape(pct: fraction))

                    Circle()
                        .fill(Color.white)
                        .frame(width: diameter, height: diameter)
                        .offset(x: (proxy.size.width - diameter) * (fraction - 0.5))

                    Circle()
                        .stroke(Color.accentColor, style: StrokeStyle(lineWidth: height))
                        .frame(width: diameter, height: diameter)
                        .overlay(label)
                        .offset(x: (proxy.size.width - diameter) * (fraction - 0.5))
                }
                .animation(.spring())
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
            }
            .frame(height: diameter + 20)
        }

        @ViewBuilder var label: some View {
            Text(String(format: "%.1f", fraction * 100))
                .foregroundColor(.accentColor)
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
