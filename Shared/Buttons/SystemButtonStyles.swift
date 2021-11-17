//
//  SystemButtonStyles.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//

import Props
import SwiftUI

extension PropGroup {
    static let systemButtons = PropGroup(name: "System buttons", samples: [
        DefaultButtonSample(),
        BorderedButtonSample(),
        BorderedProminentButtonSample(),
        BorderlessButtonSample(),
        PlainButtonSample(),
    ])
}

struct DefaultButtonSample: PropSampleable {
    let name = "Default button style"
    let notes: String? = ".buttonStyle(DefaultButtonStyle())"
    let source = "System"
    let keywords = "button system flat default"
    @ViewBuilder var body: AnyView {
        AnyView(
            EnabledAndDisabled {
                Button {} label: {
                    Text("Button")
                }
            }
            .buttonStyle(DefaultButtonStyle())
        )
    }
}

struct BorderedButtonSample: PropSampleable {
    let name = "Bordered button style"
    let notes: String? = ".buttonStyle(BorderedButtonStyle()) - iOS 15+"
    let source = "System"
    let keywords = "button system flat default border"
    @ViewBuilder var body: AnyView {
        AnyView(Group {
            if #available(iOS 15.0, *) {
                EnabledAndDisabled {
                    Button {} label: {
                        Text("Button")
                    }
                }
                .buttonStyle(BorderedButtonStyle())
            } else {
                Text("Available from iOS 15")
            }
        })
    }
}

struct BorderedProminentButtonSample: PropSampleable {
    let name = "Bordered prominent button style"
    let notes: String? = ".buttonStyle(BorderedProminentButtonStyle()) - iOS 15+"
    let source = "System"
    let keywords = "button system flat default border prominent"
    @ViewBuilder var body: AnyView {
        AnyView(Group {
            if #available(iOS 15.0, *) {
                EnabledAndDisabled {
                    Button {} label: {
                        Text("Button")
                    }
                }
                .buttonStyle(BorderedProminentButtonStyle())
            } else {
                Text("Available from iOS 15")
            }
        })
    }
}

struct BorderlessButtonSample: PropSampleable {
    let name = "Default button style"
    let notes: String? = ".buttonStyle(BorderlessButtonStyle())"
    let source = "System"
    let keywords = "button system flat default"
    @ViewBuilder var body: AnyView {
        AnyView(
            EnabledAndDisabled {
                Button {} label: {
                    Text("Button")
                }
            }
            .buttonStyle(BorderlessButtonStyle())
        )
    }
}

struct PlainButtonSample: PropSampleable {
    let name = "Plain button style"
    let notes: String? = ".buttonStyle(PlainButtonStyle())"
    let source = "System"
    let keywords = "button system flat default"
    @ViewBuilder var body: AnyView {
        AnyView(
            EnabledAndDisabled {
                Button {} label: {
                    Text("Button")
                }
            }
            .buttonStyle(PlainButtonStyle())
        )
    }
}

struct SystemButtonStyles: View {
    var body: some View {
        PropGroupView(group: .systemButtons)
    }
}

struct SystemButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        SystemButtonStyles()
            .padding()
    }
}
