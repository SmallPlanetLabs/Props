//
//  CheckboxToggleStyle.swift
//
//  Created by Quinn McHenry on 11/4/21.
//

import SwiftUI

public struct CheckBoxStyle: ToggleStyle {
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
        }
        .frame(height: 44)
        .onTapGesture {
            withAnimation {
                configuration.isOn.toggle()
            }
        }
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
        .toggleStyle(CheckBoxStyle())
    }
}
