//
//  WarpDriveProgressStyle.swift
//  
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

    public init(count: Int = 7) {
        self.count = count
    }

    public func makeBody(configuration: Configuration) -> some View {
        IndeterminateView(count: count)
    }

    struct IndeterminateView: View {
        let count: Int
        @State private var rotation = Angle.zero
        @Environment(\.primaryColor) var primaryColor: Color

        init(count: Int = 7) {
            self.count = count
        }

        var body: some View {
            GeometryReader { geometry in
                ZStack {
                    ForEach(0..<count) { index in
                        Circle()
                            .stroke(lineWidth: 1)
                            .foregroundColor(primaryColor)
                            .rotation3DEffect(rotation, axis: randomAxis())
                            .animation(
                                Animation
                                    .linear(duration: duration(index: index))
                                    .repeatCount(.max, autoreverses: false),
                                value: rotation)
                            .padding(padding(index: index, size: geometry.size))
                    }
                }
                .onAppear {
                    DispatchQueue.main.async {
                        rotation = Angle(degrees: 360)
                    }
                }
            }
        }

        func duration(index: Int) -> Double {
            .random(in: 0.5...1) + Double((count-index)) * 0.35
        }

        func randomAxis() -> (x: CGFloat, y: CGFloat, z: CGFloat) {
            let angle = Angle(degrees: .random(in: 0...90)).radians
            return (x: sin(angle), y: cos(angle), z: .random(in: -0.5...0.5))
        }

        func padding(index: Int, size: CGSize) -> CGFloat {
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
    public static func warpDrive(count: Int) -> WarpDriveProgressStyle {
        WarpDriveProgressStyle(count: count)
    }
}

struct WarpDriveProgressStyle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
            .progressViewStyle(.warpDrive(count: 7))
            .frame(width: 200, height: 200)
            .primaryColor(.blue)
    }
}

