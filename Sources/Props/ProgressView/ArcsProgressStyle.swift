//
//  ArcsProgressStyle.swift
//  
//
//  Created by Djuro on 1/27/22.
//

import Foundation
import SwiftUI

public struct ArcsProgressStyle: ProgressViewStyle {
    
    // MARK: - Initializer
    public init() {}
    
    // MARK: - ProgressViewStyle
    public func makeBody(configuration: Configuration) -> some View {
        IndeterminateView(
            count: 10,
            width: 2,
            spacing: 5
        )
        .frame(maxWidth: 150, maxHeight: 50)
    }
    
    struct IndeterminateView: View {
        
        // MARK: - Properties
        @State private var rotation = Angle.zero
        let count: Int
        let width: CGFloat
        let spacing: CGFloat
        
        // MARK: - Initializer
        init(count: Int = 5, width: CGFloat = 2, spacing: CGFloat = 2) {
            self.count = count
            self.width = width
            self.spacing = spacing
        }
        
        var body: some View {
            GeometryReader { geometry in
                ForEach(0..<count) { index in
                    arc(forIndex: index, in: geometry.size)
                        .rotationEffect(rotation)
                        .animation(
                            Animation
                                .default
                                .speed(Double.random(in: 0.2...0.4))
                                .repeatCount(.max, autoreverses: false)
                            , value: rotation
                        )
                }
            }
            .onAppear {
                DispatchQueue.main.async {
                    rotation = .degrees(360)
                }
            }
            .aspectRatio(contentMode: .fit)
        }
        
        // MARK: - Private API
        private func arc(forIndex index: Int, in geometrySize: CGSize) -> some View {
            Group { () -> Path in
                var p = Path()
                p.addArc(
                    center: CGPoint(x: geometrySize.width/2, y: geometrySize.height/2),
                    radius: geometrySize.width/2 - width/2 - CGFloat(index) * (width + spacing),
                    startAngle: .degrees(0),
                    endAngle: .degrees(Double(Int.random(in: 120...300))),
                    clockwise: true
                )
                return p.strokedPath(.init(lineWidth: width))
            }
            .frame(width: geometrySize.width, height: geometrySize.height)
        }
    }
    
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ProgressViewStyle where Self == ArcsProgressStyle {
    
    /// A `ProgressViewStyle` with a arcs rotating animation.
    public static var arcs: ArcsProgressStyle {
        ArcsProgressStyle()
    }
}

struct ArcsProgressStyle_Previews: PreviewProvider {
    static var progress: Foundation.Progress = {
        let progress = Foundation.Progress(totalUnitCount: 100)
        progress.completedUnitCount = 100
        return progress
    }()
    
    static var previews: some View {
        ProgressView(progress)
            .progressViewStyle(.arcs)
            .padding()
    }
}
