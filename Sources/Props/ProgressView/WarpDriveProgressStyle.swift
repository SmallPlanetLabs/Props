//
//  WarpDriveProgressStyle.swift
//  Props
//
//  Created by Quinn McHenry on 2/1/22.
//

import SwiftUI

/// A ``ProgressViewStyle`` with 3D rotating circles.
/// - Parameter count: Number of circles
/// 
/// Uses ``primaryColor``

public struct WarpDriveProgressStyle: ProgressViewStyle {
    let count: Int
    let signature: Signature

    /// WarpDrive Signature
    ///
    /// Specifies one of several distinct visual styles for ``WarpDriveProgressStyle```
    public enum Signature {
        /// Spins endlessly in random directions
        case random
        /// Oscillates from flat back to flat fluidly and repeatedly
        case twirl
        /// Rotates along the vertical axis only
        case vertical
    }

    public init(count: Int = 7, signature: Signature = .random) {
        self.count = count
        self.signature = signature
    }

    public func makeBody(configuration: Configuration) -> some View {
        IndeterminateView(count: count, signature: signature)
    }

    private struct IndeterminateView: View {
        let count: Int
        let signature: Signature
        @State private var rotation = Angle.zero
        @Environment(\.primaryColor) var primaryColor: Color

        var body: some View {
            GeometryReader { geometry in
                ZStack {
                    ForEach(0..<count) { index in
                        Circle()
                            .stroke(lineWidth: 1)
                            .foregroundColor(primaryColor)
                            .rotation3DEffect(rotation, axis: axis(index: index))
                            .animation(animation(index: index), value: rotation)
                            .padding(padding(index: index, size: geometry.size))
                    }
                }
                .onAppear {
                    DispatchQueue.main.async {
                        rotation = rotationAmount
                    }
                }
            }
        }

        private var rotationAmount: Angle {
            switch signature {
            case .random, .twirl, .vertical:
                return Angle(degrees: 360)
            }
        }

        private func animation(index: Int) -> Animation {
            switch signature {
            case .random:
                return Animation
                    .linear(duration: .random(in: 0.5...1) + Double((count-index)) * 0.35)
                    .repeatCount(.max, autoreverses: false)
            case .twirl:
                return Animation
                    .easeInOut(duration: 1.4)
                    .repeatCount(.max, autoreverses: true)
            case .vertical:
                return Animation
                    .linear(duration: 0.5 + Double(count - index) * 0.2)
                    .repeatCount(.max, autoreverses: false)
            }
        }

        private func axis(index: Int) -> (x: CGFloat, y: CGFloat, z: CGFloat) {
            let ratio = Double(index)/Double(count)
            let angle: Angle
            let z: Double
            switch signature {
            case .random:
                angle = Angle(degrees: .random(in: 0...90))
                z = .random(in: -0.5...0.5)
            case .twirl:
                angle = .zero
                z = ratio
            case .vertical:
                angle = .zero
                z = 0
            }
            return (x: sin(angle.radians), y: cos(angle.radians), z: z)
        }

        private func padding(index: Int, size: CGSize) -> CGFloat {
            CGFloat(min(size.width, size.height)) / CGFloat(count) / 2 * CGFloat(index)
        }
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ProgressViewStyle where Self == WarpDriveProgressStyle {

    /// A ``ProgressViewStyle`` with 3D rotating circles.
    public static var warpDrive: WarpDriveProgressStyle {
        WarpDriveProgressStyle()
    }

    /// A ``ProgressViewStyle`` with 3D rotating circles.
    /// - Parameter count: Number of circles
    public static func warpDrive(count: Int = 7, signature: WarpDriveProgressStyle.Signature) -> WarpDriveProgressStyle {
        WarpDriveProgressStyle(count: count, signature: signature)
    }
}

struct WarpDriveProgressStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ProgressView()
                .progressViewStyle(.warpDrive(count: 7, signature: .random))

            ProgressView()
                .progressViewStyle(.warpDrive(count: 7, signature: .twirl))

            ProgressView()
                .progressViewStyle(.warpDrive(count: 7, signature: .vertical))
        }
        .frame(width: 200)
        .primaryColor(.blue)
    }
}

