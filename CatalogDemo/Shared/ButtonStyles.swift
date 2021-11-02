//
//  ButtonStyles.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//
// see https://developer.apple.com/documentation/swiftui/buttonstyle

import SwiftUI

struct ButtonStyles_Previews: PreviewProvider {

    static var previews: some View {
        ScrollView {
            VStack(spacing: 20) {
                Group {
                    Text("System ButtonStyles").font(.title)
                    EnabledAndDisabled {
                        Button("Unstyled Button") {}
                    }

                    EnabledAndDisabled {
                        Button("DefaultButtonStyle") {}.buttonStyle(DefaultButtonStyle())
                    }

                    if #available(iOS 15.0, *) {
                        EnabledAndDisabled {
                            Button("BorderedButtonStyle") {}.buttonStyle(BorderedButtonStyle())
                        }

                        EnabledAndDisabled {
                            Button("BorderedProminentButtonStyle") {}.buttonStyle(BorderedProminentButtonStyle())
                        }
                        .tint(.orange)

                    }

                    EnabledAndDisabled {
                        Button("BorderlessButtonStyle") {}.buttonStyle(BorderlessButtonStyle())
                    }

                    EnabledAndDisabled {
                        Button("PlainButtonStyle") {}.buttonStyle(PlainButtonStyle())
                    }
                }

                Group {
                    Text("Custom ButtonStyles").font(.title)

                    EnabledAndDisabled {
                        Button("Custom OutlineButton") {}.buttonStyle(OutlineButton())
                    }

                    EnabledAndDisabled {
                        Button("FilledButton") {}.buttonStyle(FilledButton())
                    }
                    .accentColor(.blue)
                }

            }
            .accentColor(.green)
        .padding()
        }
    }
}

struct OutlineButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let background = RoundedRectangle(cornerRadius: 8,style: .continuous)
                .stroke(configuration.isPressed ? .gray : Color.accentColor)

        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .accentColor)
            .padding()
            .background(background)
    }
}

struct FilledButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let background = RoundedRectangle(cornerRadius: 0, style: .continuous)
                .fill(configuration.isPressed ? .gray : Color.accentColor)

        configuration
            .label
            .foregroundColor(.white)
            .padding()
            .background(background)
    }
}

// MARK: - Helpers

struct EnabledAndDisabled<Content>: View where Content: View {
    @ViewBuilder var content: Content

    var body: some View {
        HStack {
            content
            content.disabled(true)
        }
    }
}
