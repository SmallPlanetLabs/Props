//
//  ButtonStyles.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//
// see https://developer.apple.com/documentation/swiftui/buttonstyle

import SwiftUI
import Props

extension PropGroup {
    static let flatButtons = PropGroup(name: "System buttons", samples: [
        FilledButtonSample()
    ])
}

struct FilledButtonSample: PropSampleable {
    let name = "Filled button style"
    let notes: String? = ".buttonStyle(FilledButton())"
    let source = "Custom"
    let keywords = "button custom flat rectangle filled"
    @ViewBuilder var body: AnyView {
        AnyView(
            EnabledAndDisabled {
                HStack {
                    Button { } label: {
                        Text("Filled Button")
                    }
                    Button { } label: {
                        Label("Filled Button", systemImage: "heart.fill")
                    }
                }
                .buttonStyle(FilledButton())
            }
        )
    }
}

struct ButtonStyles: View {
    var body: some View {
        VStack(spacing: 12) {
            Group {
                EnabledAndDisabled {
                    Button("Button") {}
                }
            }
            .buttonStyle(PaperShadowedButton())
            .font(.custom("ArialRoundedMTBold", fixedSize: 24))
            .primaryColor(Color(white: 0.5))

            Group {
                EnabledAndDisabled {
                    Button("Filled Button") {}
                }

                EnabledAndDisabled {
                    Button { } label: {
                        HStack { Text("Filled Button"); Image(systemName: "greaterthan") }
                    }
                }

                EnabledAndDisabled {
                    Button { } label: { Image(systemName: "greaterthan") }
                }
            }
            .buttonStyle(FilledButton())

            Group {
                EnabledAndDisabled {
                    Button("Outlined Button") {}
                }

                EnabledAndDisabled {
                    Button { } label: {
                        HStack(spacing: 12) { Text("Outlined Button"); Image(systemName: "greaterthan") }
                    }
                }

                EnabledAndDisabled {
                    Button { } label: { Image(systemName: "greaterthan") }
                }
            }
            .buttonStyle(OutlinedButton())
        }
    }
}

struct ButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices {
            PropGroupView(group: .flatButtons)
        }
        .primaryColor(.purple)
    }
}

// MARK: - Helpers

struct EnabledAndDisabled<Content>: View where Content: View {
    @ViewBuilder var content: Content

    var body: some View {
        VStack(spacing: 10) {
            content
                .modifier(CloneDisabled())
        }
    }
}
