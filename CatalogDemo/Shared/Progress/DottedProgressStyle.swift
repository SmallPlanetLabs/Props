//
//  DottedProgressStyle.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI

struct DottedProgressStyle: ProgressViewStyle {

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
        let height = CGFloat(10)
        let stroke = StrokeStyle(lineWidth: 10, lineCap: CGLineCap.round, lineJoin: CGLineJoin.round, miterLimit: 0, dash: [0, 25], dashPhase: 0)

        var body: some View {
            GeometryReader { proxy in
                ZStack {
                    Line()
                        .stroke(Color.accentColor.tinted(amount: 0.7), style: stroke)
                        .frame(height: height)

                    Line()
                        .stroke(Color.accentColor, style: stroke)
                        .clipShape(ClipShape(pct: fraction))
                        .frame(height: height)
                }
                .animation(.spring())
            }
            .frame(height: height)
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
            Path(CGRect(origin: CGPoint(x: -rect.height / 2, y: -rect.height / 2), size: CGSize(width: (rect.width + rect.height) * CGFloat(pct), height: rect.height)))
        }
    }

     struct Line: Shape {
         func path(in rect: CGRect) -> Path {
             var p = Path()
             p.move(to: .zero)
             p.addLines([.zero, CGPoint(x: rect.width, y: 0)])
             return p
         }
     }
}


struct DottedProgressStyle_Previews: PreviewProvider {
    static var progress: Foundation.Progress = {
        let progress = Foundation.Progress(totalUnitCount: 20)
        progress.completedUnitCount = 20
        return progress
    }()
    static var previews: some View {
        ProgressView(progress)
            .progressViewStyle(DottedProgressStyle())
            .padding()
    }
}
