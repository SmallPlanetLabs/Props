//
//  BarsProgressStyle.swift
//  
//
//  Created by Djuro on 1/24/22.
//

import SwiftUI

public struct BarsProgressStyle: ProgressViewStyle {
    
    // MARK: - Initializer
    public init() {}
    
    // MARK: - ProgressViewStyle
    public func makeBody(configuration: Configuration) -> some View {
        IndeterminateView(count: 8,
                          spacing: 8,
                          cornerRadius: 8,
                          scaleRange: 0.5...1,
                          opacityRange: 0.25...1)
            .frame(width: 200, height: 50)
    }
    
    struct IndeterminateView: View {
        
        // MARK: - Properties
        @State var isOn = false
        let count: Int
        let spacing: CGFloat
        let cornerRadius: CGFloat
        let scaleRange: ClosedRange<Double>
        let opacityRange: ClosedRange<Double>
        private var scale: CGFloat { CGFloat(isOn ? scaleRange.lowerBound : scaleRange.upperBound) }
        private var opacity: Double { isOn ? opacityRange.lowerBound : opacityRange.upperBound }
        
        var body: some View {
            GeometryReader { geometry in
                ForEach(0..<count) { index in
                    bar(forIndex: index, in: geometry.size)
                }
            }
            .aspectRatio(contentMode: .fit)
            .onAppear {
                isOn = true
            }
        }
        
        // MARK: - Private API
        private func size(count: Int, geometry: CGSize) -> CGFloat {
            (geometry.width/CGFloat(count)) - (spacing - 2)
        }
        
        private func bar(forIndex index: Int, in geometrySize: CGSize) -> some View {
            RoundedRectangle(cornerRadius: cornerRadius,  style: .continuous)
                .frame(width: size(count: count, geometry: geometrySize),
                       height: geometrySize.height)
                .scaleEffect(x: 1, y: scale, anchor: .center)
                .opacity(opacity)
                .animation(
                    Animation
                        .default
                        .repeatCount(isOn ? .max : 1, autoreverses: true)
                        .delay(Double(index) / Double(count) / 2)
                )
                .offset(x: CGFloat(index) * (size(count: count, geometry: geometrySize) + spacing))
        }
    }
    
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ProgressViewStyle where Self == BarsProgressStyle {
    
    /// A `ProgressViewStyle` with a bars collapsing and expanding animation.
    public static var bars: BarsProgressStyle {
        BarsProgressStyle()
    }
}

struct BarsProgressStyle_Previews: PreviewProvider {
    static var progress: Foundation.Progress = {
        let progress = Foundation.Progress(totalUnitCount: 100)
        progress.completedUnitCount = 100
        return progress
    }()
    
    static var previews: some View {
        ProgressView(progress)
            .progressViewStyle(.bars)
            .padding()
    }
}
