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
        IndeterminateView(
            count: 8,
            spacing: 8,
            cornerRadius: 8,
            scaleRange: 0.5...2,
            opacityRange: 0.25...1
        )
        .frame(maxWidth: 150, maxHeight: 50)
    }
    
    struct IndeterminateView: View {
        
        // MARK: - Properties
        @State var isOn = false
        let count: Int
        let spacing: CGFloat
        let cornerRadius: CGFloat
        let scaleRange: ClosedRange<Double>
        let opacityRange: ClosedRange<Double>
        private var scale: CGFloat {
            CGFloat(isOn ? scaleRange.lowerBound : scaleRange.upperBound)
        }
        private var opacity: Double {
            isOn ? opacityRange.lowerBound : opacityRange.upperBound
        }
        
        var body: some View {
            HStack {
                ForEach(0..<count) { index in
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .frame(width: 1)
                        .scaleEffect(x: 1, y: scale)
                        .opacity(opacity)
                        .animation(
                            Animation
                                .default
                                .repeatCount(.max, autoreverses: true)
                                .delay(Double(index) / Double(count) / 2)
                            , value: isOn)
                    
                    Spacer()
                }
            }
            .onAppear {
                isOn = true
            }
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
