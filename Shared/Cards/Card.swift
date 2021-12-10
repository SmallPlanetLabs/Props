//
//  Card.swift
//  Catalog (iOS)
//
//  Created by Djuro on 12/10/21.
//

import SwiftUI

enum ShapeType: String {
    case shape1 = "shape-1"
    case shape2 = "shape-2"
    case shape3 = "shape-3"
}

struct Card<Content: View>: View {
    
    // MARK: - Properties
    let shape: ShapeType
    var content: () -> Content
    
    // MARK: - View
    var body: some View {
        content()
            .padding()
            .background(
                Image(shape.rawValue)
                    .resizable()
            )
            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 5, y: 5)
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Card(shape: .shape1) {
                Text("Documentation")
                    .font(Font.custom("ChalkboardSE-Light", fixedSize: 16))
            }
        }
    }
}
