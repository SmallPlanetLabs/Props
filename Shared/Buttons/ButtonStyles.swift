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
            ScrollView {
                ButtonStyles()
                    .padding()
                    .previewLayout(.sizeThatFits)
            }
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
