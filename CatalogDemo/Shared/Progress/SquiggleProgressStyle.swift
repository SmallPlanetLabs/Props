//
//  SquiggleProgressStyle.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/3/21.
//

import SwiftUI

struct SquiggleProgressStyle: ProgressViewStyle {
    static let thickness = CGFloat(10)
    static let diameter = CGFloat(50)

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
        // let thickness = SquiggleProgressStyle.thickness

        var body: some View {
            GeometryReader { proxy in
                ZStack {
                    RoundedRectangle(cornerRadius: thickness / 2)
                        .fill(Color.accentColor.tinted(amount: 0.8))
                        .frame(height: thickness)
                        .clipShape(ClipShape(pct: fraction, trailing: false))

                    Wave(magnitude: thickness * 0.75, frequency: 34)
                        .stroke(Color.accentColor, style: StrokeStyle(lineWidth: thickness, lineCap: .round, lineJoin: .round, miterLimit: 0))
                        .frame(height: 50)
                        .clipShape(ClipShape(pct: fraction, trailing: true))

                    Circle()
                        .fill(Color.accentColor)
                        .frame(width: diameter, height: diameter)
                        .offset(x: (proxy.size.width - diameter) * (fraction - 0.5))
                }
                .animation(.spring())
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
            }
            .frame(height: diameter + 20)
        }

        @ViewBuilder var label: some View {
            Text(String(format: "%.0f", fraction * 100))
                .foregroundColor(.accentColor)
        }
    }

    struct ClipShape: Shape {
        var pct: Double
        let trailing: Bool

        var animatableData: Double {
            get { pct }
            set { pct = newValue }
        }

        func path(in rect: CGRect) -> Path {
            let offset = CGFloat(pct) * rect.width
            let origin = CGPoint(x: trailing ? -thickness : offset, y: 0)
            let size = CGSize(width: trailing ? offset : rect.width - offset, height: rect.height)
            return Path(CGRect(origin: origin, size: size))
        }
    }

    struct Wave: Shape {
        var magnitude: Double
        var frequency: Double

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath()
            let width = Double(rect.width)
            let height = Double(rect.height)
            let midHeight = height / 2

            let wavelength = width / frequency
            path.move(to: CGPoint(x: 0, y: midHeight))

            for x in stride(from: thickness, through: width, by: 1) {
                let relativeX = x / wavelength
                let sine = sin(relativeX)
                let y = magnitude * sine + midHeight
                path.addLine(to: CGPoint(x: x, y: y))
            }

            return Path(path.cgPath)
        }
    }
}

struct SquiggleProgressStyle_Previews: PreviewProvider {
    static var progress: Foundation.Progress = {
        let progress = Foundation.Progress(totalUnitCount: 20)
        progress.completedUnitCount = 11
        return progress
    }()
    static var previews: some View {
        ProgressView(progress)
            .progressViewStyle(SquiggleProgressStyle())
            .padding()
    }
}
