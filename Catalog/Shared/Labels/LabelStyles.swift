//
//  LabelStyles.swift
//  Catalog (iOS)
//
//  Created by Djuro on 1/4/22.
//

import Props
import SwiftUI

extension PropGroup {
    static let systemLabels = PropGroup(name: "System labels",
                                        samples: [
                                            DefaultLabelSample(),
                                            IconOnlyLabelSample(),
                                            TitleAndIconLabelSample(),
                                            TitleOnlyLabelSample()
                                        ])
}

struct DefaultLabelSample: PropSampleable {
    let name = "Default label style"
    let notes: String? = ".labelStyle(DefaultLabelStyle())"
    let source = "System"
    let keywords = "label system default"
    @ViewBuilder var body: AnyView {
        AnyView(
            Label {
                Text("Label")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
            } icon: {
                Image(systemName: "pencil.slash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
            }
            .labelStyle(DefaultLabelStyle())
        )
    }
}

struct IconOnlyLabelSample: PropSampleable {
    let name = "Icon only label style"
    let notes: String? = ".labelStyle(.iconOnly)"
    let source = "System"
    let keywords = "label system icon only"
    @ViewBuilder var body: AnyView {
        AnyView(
            Label {
                Text("Label")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
            } icon: {
                Image(systemName: "pencil.slash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
            }
            .labelStyle(.iconOnly)
        )
    }
}

struct TitleAndIconLabelSample: PropSampleable {
    let name = "Title and icon label style"
    let notes: String? = ".labelStyle(.titleAndIcon)"
    let source = "System"
    let keywords = "label system title icon"
    @ViewBuilder var body: AnyView {
        AnyView(
            Label {
                Text("Label")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
            } icon: {
                Image(systemName: "pencil.slash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
            }
            .labelStyle(.titleAndIcon)
        )
    }
}

struct TitleOnlyLabelSample: PropSampleable {
    let name = "Title only label style"
    let notes: String? = ".labelStyle(.titleOnly)"
    let source = "System"
    let keywords = "label system title only"
    @ViewBuilder var body: AnyView {
        AnyView(
            Label {
                Text("Label")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
            } icon: {
                Image(systemName: "pencil.slash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
            }
            .labelStyle(.titleOnly)
        )
    }
}

struct SystemLabelStyles: View {
    var body: some View {
        PropGroupView(group: .systemLabels)
    }
}

struct SystemLabelStyles_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices(combos: .lightDarkiPhoneBig) {
            SystemLabelStyles()
        }
    }
}
