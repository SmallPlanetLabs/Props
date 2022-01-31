//
//  CheckboxToggleStyle.swift
//
//  Created by Quinn McHenry on 11/4/21.
//

import SwiftUI

public struct CheckboxToggleStyle: ToggleStyle {
    @Environment(\.primaryColor) var primaryColor: Color
    public init() {}
    public func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 3)
                    .stroke(lineWidth: 1)
                    .fill(primaryColor)
                    .frame(width: 19, height: 19)

                RoundedRectangle(cornerRadius: 3.0)
                    .fill(primaryColor)
                    .frame(width: 13, height: 13)
                    .opacity(configuration.isOn ? 1 : 0)
            }
            configuration.label
                .foregroundColor(primaryColor)
        }
        .frame(height: 44)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation {
                configuration.isOn.toggle()
            }
        }
    }
}

@available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
extension ToggleStyle where Self == CheckboxToggleStyle {

    /// A `ToggleStyle` that appears as a slightly rounded square with an inset filled indicator
    /// The toggle is tinted with `primaryColor`
    public static var checkBox: CheckboxToggleStyle {
        CheckboxToggleStyle()
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Toggle(isOn: .constant(true)) {
                Text("This one is on")
            }
            Toggle(isOn: .constant(false)) {
                Text("This one is 🙅‍♀️")
            }
        }
        .toggleStyle(.checkBox)
    }
}
