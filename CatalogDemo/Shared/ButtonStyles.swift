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
            VStack(spacing: 12) {
                Group {
                    Divider()
                    Text("Custom ButtonStyles").font(.title)

                    Group {
                        EnabledAndDisabled(title: "FilledButton") {
                            Button("Filled Button") {}
                        }

                        EnabledAndDisabled (title: nil) {
                            Button { } label: {
                                HStack { Text("Filled Button").fixedSize(); Image(systemName: "greaterthan") }
                            }
                        }

                        EnabledAndDisabled(title: nil) {
                            Button { } label: { Image(systemName: "greaterthan") }
                        }
                    }
                    .buttonStyle(FilledButton())

                    Group {
                        EnabledAndDisabled(title: "OutlinedButton") {
                            Button("OutlinedButton") {}
                        }

                        EnabledAndDisabled (title: nil) {
                            Button { } label: {
                                HStack(spacing: 12) { Text("Outlined Button").fixedSize(); Image(systemName: "greaterthan") }
                            }
                        }

                        EnabledAndDisabled(title: nil) {
                            Button { } label: { Image(systemName: "greaterthan") }
                        }
                    }
                    .buttonStyle(OutlinedButton())

                    Group {
                        EnabledAndDisabled(title: "FanciedButton") {
                            Button("Button") {}
                        }
                    }
                    .buttonStyle(FanciedButton())
                    .font(.custom("ArialRoundedMTBold", fixedSize: 24))

                }
                .accentColor(.blue)

                Group {
                    Text("System ButtonStyles").font(.title)
                    EnabledAndDisabled(title: "Unstyled Button") {
                        Button("Unstyled Button") {}
                    }

                    EnabledAndDisabled(title: "DefaultButtonStyle") {
                        Button("DefaultButtonStyle") {}.buttonStyle(DefaultButtonStyle())
                    }

                    if #available(iOS 15.0, *) {
                        EnabledAndDisabled(title: "BorderedButtonStyle iOS 15+)") {
                            Button("BorderedButtonStyle") {}.buttonStyle(BorderedButtonStyle())
                        }

                        EnabledAndDisabled(title: "BorderedProminentButtonStyle (iOS 15+") {
                            Button("BorderedProminentButtonStyle") {}.buttonStyle(BorderedProminentButtonStyle())
                        }
                        .tint(.orange)

                    }

                    EnabledAndDisabled(title: "BorderlessButtonStyle") {
                        Button("BorderlessButtonStyle") {}.buttonStyle(BorderlessButtonStyle())
                    }

                    EnabledAndDisabled(title: "PlainButtonStyle") {
                        Button("PlainButtonStyle") {}.buttonStyle(PlainButtonStyle())
                    }
                }

            }
            .padding()
            .padding(.bottom, 100)
        .previewLayout(.sizeThatFits)
        }
    }
}

// TODO: add an Environment value for corner radius

struct OutlinedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let background = RoundedRectangle(cornerRadius: 2, style: .continuous)
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
        let background = RoundedRectangle(cornerRadius: 2, style: .continuous)
            .fill(configuration.isPressed ? .gray : Color.accentColor)

        configuration
            .label
            .foregroundColor(.white)
            .padding()
            .background(background)
    }
}

struct FanciedButton: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    func makeBody(configuration: Configuration) -> some View {
        let radius = radius(for: configuration)
        let xy = offset(for: configuration)
        let background = Capsule()
            .fill(color(for: configuration))
            .shadow(color: Color(white: 0.6), radius: radius, x: xy, y: xy)

        configuration
            .label
            .padding()
            .background(background)
            .foregroundColor(.accentColor.opacity(isEnabled ? 1 : 0.4))

    }

    func color(for configuration: Configuration) -> Color {
        if configuration.isPressed {
            return Color(white: 0.95, opacity: 1)
        } else {
            return Color(white: 0.95, opacity: 1)
        }
    }

    func radius(for configuration: Configuration) -> CGFloat {
        if configuration.isPressed {
            return 6
        } else if isEnabled {
            return 12
        } else {
            return 2
        }
    }

    func offset(for configuration: Configuration) -> CGFloat {
        if configuration.isPressed {
            return 6
        } else if isEnabled {
            return 12
        } else {
            return 2
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
                content.disabled(true)
            }
        }
    }
}
