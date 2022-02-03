//
//  RotatingCirclesProgressStyle.swift
//  
//
//  Created by Djuro on 2/3/22.
//

import Foundation
import SwiftUI

public struct RotatingCirclesProgressStyle: ProgressViewStyle {
    
    // MARK: - Initializer
    public init() {}
    
    // MARK: - ProgressViewStyle
    public func makeBody(configuration: Configuration) -> some View {
        IndeterminateView(
            count: 6,
            size: 8
        )
        .frame(maxWidth: 150, maxHeight: 50)
    }
    
    struct IndeterminateView: View {
        
        // MARK: - Properties
        @State private var isOn = false
        let count: Int
        let content: AnyView
        
        // MARK: - Initializers
        init(count: Int = 6, size: CGFloat = 8) {
            self.count = count
            self.content = AnyView(Circle().frame(width: size, height: size))
        }
        
        var body: some View {
            GeometryReader { geometry in
                ForEach(0..<count) { index in
                    circle(forIndex: index, in: geometry.size)
                        .rotationEffect(isOn ? .degrees(360) : .degrees(0))
                        .animation(
                            Animation
                                .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 1.5)
                                .repeatCount(isOn ? .max : 1, autoreverses: false)
                            , value: isOn
                        )
                }
            }
            .onAppear {
                isOn = true
            }
            .aspectRatio(contentMode: .fit)
        }
        
        private func circle(forIndex index: Int, in geometrySize: CGSize) -> some View {
            content
                .frame(width: geometrySize.width, height: geometrySize.height)
                .scaleEffect(isOn ? animatingScale(forIndex: index) : 1 )
                .offset(y: geometrySize.width / 10 - geometrySize.height / 2)
        }
        
        private func animatingScale(forIndex index: Int) -> CGFloat { CGFloat(index + 1) / CGFloat(count)
        }
        
    }
    
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ProgressViewStyle where Self == RotatingCirclesProgressStyle {
    
    /// A `ProgressViewStyle` with a circles rotating animation.
    public static var rotatingCircles: RotatingCirclesProgressStyle {
        RotatingCirclesProgressStyle()
    }
}

struct RotatingCirclesProgressStyle_Previews: PreviewProvider {
    static var progress: Foundation.Progress = {
        let progress = Foundation.Progress(totalUnitCount: 100)
        progress.completedUnitCount = 100
        return progress
    }()
    
    static var previews: some View {
        ProgressView(progress)
            .progressViewStyle(.rotatingCircles)
            .padding()
    }
}
