//
//  ToggleStyles.swift
//  Catalog (iOS)
//
//  Created by Quinn McHenry on 11/3/21.
//

import SwiftUI

@available(iOS 15.0, *)
struct ToggleStyles: View {
    @State private var flag = false

    var body: some View {
        VStack(spacing: 10) {
            Text("is enabled \(flag ? "yes" : "no")")

            Toggle(isOn: $flag) {
                Text("Enabled")
            }.toggleStyle(.button)


            VStack {
                Toggle("Vibrate on Ring", isOn: .constant(true))
                Toggle("Vibrate on Silent", isOn: .constant(false))
            }
            .toggleStyle(.switch)
        }
        .padding()
    }
}

struct ToggleExample<Content>: View where Content: View {
    let title: String
    @State private var isOn = true
    @State private var isOnClone = false
    @ViewBuilder var content: Content

    var body: some View {
        VStack {
            HStack {
                Text(title).font(.caption)
                Spacer()
            }
            Toggle(isOn: $isOn) {
                content
            }
            Toggle(isOn: $isOnClone) {
                content
            }
        }
    }
}

@available(iOS 15.0, *)
struct ToggleStyles_Previews: PreviewProvider {
    static var previews: some View {
        ToggleExample(title: ".button") {
            Text("Toggler")
        }
        .toggleStyle(.button)
        .padding()
    }
}
