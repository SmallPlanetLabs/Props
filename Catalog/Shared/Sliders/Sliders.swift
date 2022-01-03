//
//  Sliders.swift
//  Catalog (iOS)
//
//  Created by Quinn McHenry on 11/4/21.
//

import Sliders
import SwiftUI

struct Sliders: View {
    @State private var value = CGFloat(0.5)
    @State private var range1 = 0.2 ... 0.8
    @State private var pointX1 = 0.5
    @State private var pointY1 = 0.5
    @State private var value1 = 0.5

    let rainbow = LinearGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .pink]), startPoint: .leading, endPoint: .trailing)

    var body: some View {
        ScrollView {
            VStack {
                Text("Custom Sliders").font(.title)

                ValueSlider(value: $value1)

                ValueSlider(value: $value1)
                    .valueSliderStyle(
                        HorizontalValueSliderStyle(thumbSize: CGSize(width: 16, height: 32))
                    )

                ValueSlider(value: $value1)
                    .valueSliderStyle(
                        HorizontalValueSliderStyle(track: rainbow.frame(height: 8).cornerRadius(4))
                    )

                PointSlider(x: $pointX1, y: $pointY1)
                    .frame(height: 256)
                    .pointSliderStyle(
                        RectangularPointSliderStyle(
                            track:
                            ZStack {
                                LinearGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .pink]), startPoint: .leading, endPoint: .trailing)
                                LinearGradient(gradient: Gradient(colors: [.white, .clear]), startPoint: .bottom, endPoint: .top).blendMode(.hardLight)
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 24)
                                    .strokeBorder(lineWidth: 4)
                                    .foregroundColor(Color.white)
                            )
                            .cornerRadius(24),
                            thumbSize: CGSize(width: 48, height: 48)
                        )
                    )

                RangeSlider(range: $range1, step: 0.01)
                    .frame(height: 60)

                RangeSlider(range: $range1)
                    .rangeSliderStyle(
                        HorizontalRangeSliderStyle(
                            track:
                            HorizontalRangeTrack(
                                view: Capsule()
                            )
                            .background(Capsule().foregroundColor(Color.purple.opacity(0.25)))
                            .frame(height: 8),
                            lowerThumb: RoundedRectangle(cornerRadius: 5),
                            upperThumb: RoundedRectangle(cornerRadius: 5),
                            lowerThumbSize: CGSize(width: 32, height: 32),
                            upperThumbSize: CGSize(width: 32, height: 32),
                            options: .forceAdjacentValue
                        )
                    )
                    .foregroundColor(.purple)
                    .frame(height: 60)

                RangeSlider(range: $range1)
                    .rangeSliderStyle(
                        HorizontalRangeSliderStyle(
                            track:
                            HorizontalRangeTrack(
                                view: rainbow
                            )
                            .background(rainbow.opacity(0.25))
                            .frame(height: 32)
                            .cornerRadius(16),
                            lowerThumb: Circle().foregroundColor(.white).shadow(radius: 3),
                            upperThumb: Circle().rotation(Angle(degrees: 180)).foregroundColor(.white).shadow(radius: 3),
                            lowerThumbSize: CGSize(width: 32, height: 32),
                            upperThumbSize: CGSize(width: 32, height: 32)
                        )
                    )
                    .frame(height: 60)

                Text("System Slider").font(.title)

                Slider(value: $value)
            }
            .padding()
        }
    }
}

struct Sliders_Previews: PreviewProvider {
    static var previews: some View {
        Sliders()
    }
}
