//
//  Cards.swift
//  Catalog (iOS)
//
//  Created by Djuro on 12/10/21.
//

import SwiftUI
import Props

/// Future possibilities: gradients, shadows

extension PropGroup {
    static let cards = PropGroup(name: "Cards", subgroups: [
        .handwriting,
    ])
}

struct Cards_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices(combos: .lightDarkiPhoneBig) {
            PropGroupView(group: .cards)
        }
    }
}

extension PropGroup {
    static let handwriting = PropGroup(name: "Cards", samples: [
        HandwritingSample(),
    ])
}

// MARK: - Samples

struct HandwritingSample: PropSampleable {
    let name = "Exploring handwriting cards"
    let notes: String? = nil
    let source = "Custom"
    let keywords = "cards handwriting handmade"
    @ViewBuilder var body: AnyView {
        AnyView(HandwritingDemo())
    }
}

/// Cards made with hand
struct HandwritingDemo: View {
    
    // MARK: - Properties
    private let labelWidth: CGFloat = 80
    private let height: CGFloat = 30
    
    var body: some View {
        VStack {
            Card(shape: .shape1) {
                Text("Documentation")
                    .font(Font.custom("ChalkboardSE-Light", fixedSize: 18))
            }
            
            Card(shape: .shape2) {
                Text("About")
                    .font(Font.custom("ChalkboardSE-Light", fixedSize: 18))
            }
            
            Card(shape: .shape3) {
                Text("Links")
                    .font(Font.custom("ChalkboardSE-Light", fixedSize: 18))
            }
        }
    }
}

