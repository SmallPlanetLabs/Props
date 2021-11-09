//
//  ButtonStyles.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//
// see https://developer.apple.com/documentation/swiftui/buttonstyle

import SwiftUI
import Props

struct ButtonStyles: View {
    var body: some View {
        VStack(spacing: 12) {
                Group {
                    EnabledAndDisabled(title: "PaperShadowedButton") {
                        Button("Button") {}
                    }
                }
                .buttonStyle(PaperShadowedButton())
                .font(.custom("ArialRoundedMTBold", fixedSize: 24))
                .primaryColor(Color(white: 0.5))

                Group {
                    EnabledAndDisabled(title: "FilledButton") {
                        Button("Filled Button") {}
                    }

                    EnabledAndDisabled (title: nil) {
                        Button { } label: {
                            HStack { Text("Filled Button"); Image(systemName: "greaterthan") }
                        }
                    }

                    EnabledAndDisabled(title: nil) {
                        Button { } label: { Image(systemName: "greaterthan") }
                    }
                }
                .buttonStyle(FilledButton())

                Group {
                    EnabledAndDisabled(title: "OutlinedButton") {
                        Button("Outlined Button") {}
                    }

                    EnabledAndDisabled (title: nil) {
                        Button { } label: {
                            HStack(spacing: 12) { Text("Outlined Button"); Image(systemName: "greaterthan") }
                        }
                    }

                    EnabledAndDisabled(title: nil) {
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
            ScrollView {
                ButtonStyles()
                    .padding()
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}

// MARK: - Helpers

struct EnabledAndDisabled<Content>: View where Content: View {
    let title: String?
    @ViewBuilder var content: Content

    var body: some View {
        VStack(spacing: 10) {
            if let title = title {
                HStack {
                    Text(title).font(.caption)
                    Spacer()
                }
            }
            HStack {
                content
                    .modifier(CloneDisabled())
            }
        }
    }
}
