//
//  ScantronToggleStyle.swift
//  Props
//
//  Created by Quinn McHenry on 1/31/22.
//

import SwiftUI
import PreviewMultiple

/// A `ToggleStyle` inspiered by number 2 pencils filling in bubbles on paper sheets
///
/// - Parameter seed: the same seed value will have the same random-seeming appearance.
///
/// The `seed` value is used to associate the appearance of the filled circle with an identity in a scene. When a state change triggers a refresh of the scene, if the seed remains constant (perhaps derived from the associated View's identity), the appearance of the filled toggle will remain unchanged. Using different seeds for different instances will prevent the sameness of what should appear random.
///
/// The toggle is tinted with both `primaryColor`.

public struct ScantronToggleStyle: ToggleStyle {
    @Environment(\.primaryColor) var primaryColor: Color
    @Environment(\.secondaryColor) var secondaryColor: Color
    let seed: Int
    private let style = StrokeStyle(lineWidth: 3.00, lineCap: .round, lineJoin: .round)

    public func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 1)
                    .fill(secondaryColor)
                    .frame(width: 30, height: 30)

                PencilFilledCircle(seed: seed)
                    .trim(from: 0, to: configuration.isOn ? 1 : 0)
                    .stroke(style: style)
                    .foregroundColor(primaryColor)
                    .frame(width: 22, height: 22)
            }
            configuration.label
                .foregroundColor(primaryColor)
        }
        .frame(minWidth: 44, minHeight: 44)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.easeOut(duration: 1)) {
                configuration.isOn.toggle()
            }
        }
    }

    struct PencilFilledCircle: Shape {
        let seed: Int

        private static let scatters = (0..<127).map { _ in CGFloat.random(in: -1...1) }

        func path(in rect: CGRect) -> Path {
            var scatterIndex = seed
            func scatter() -> CGFloat {
                scatterIndex += 1
                return PencilFilledCircle.scatters[scatterIndex % PencilFilledCircle.scatters.count] * CGFloat(radius * 0.2)
            }

            var p = Path()
            let steps = 57
            let radius = min(rect.width, rect.height) / 2
            (0..<steps).forEach { yIndex in
                let y = rect.height * CGFloat(yIndex) / CGFloat(steps)
                let heightFromCenter = y - rect.height/2
                let sumOfSquared = CGFloat(radius*radius - heightFromCenter*heightFromCenter)
                let widthFromCenter = sqrt(sumOfSquared)
                let x = yIndex.isMultiple(of: 2) ? radius + widthFromCenter : radius - widthFromCenter
                let point = CGPoint(x: x + scatter(), y: y + scatter())
                if yIndex == 0 {
                    p.move(to: point)
                } else {
                    p.addLine(to: point)
                }
            }
            return p
        }
    }

    public init(seed: Int = 0) {
        self.seed = seed
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToggleStyle where Self == ScantronToggleStyle {

    /// A `ToggleStyle` inspiered by number 2 pencils filling in bubbles on paper sheets
    /// The toggle is tinted with both `primaryColor`
    public static var scantron: ScantronToggleStyle {
        ScantronToggleStyle()
    }

    /// A `ToggleStyle` inspiered by number 2 pencils filling in bubbles on paper sheets
    /// The toggle is tinted with both `primaryColor`
    /// - Parameter seed: the same seed value will have the same random-seeming appearance.
    public static func scantron(seed: Int) -> ScantronToggleStyle {
        ScantronToggleStyle(seed: seed)
    }
}

struct ScantronToggleStyle_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            ForEach(0..<6) { column in
                VStack {
                    ForEach(0..<12) { index in
                        Toggle(isOn: .constant(true)) { }
                        .toggleStyle(.scantron(seed: column * 12 + index))
                    }
                }
            }
        }
    }
}
