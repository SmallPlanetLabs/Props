//
//  Planet.swift
//  Forms
//
//  Created by Quinn McHenry on 11/1/21.
//

import SwiftUI

struct Planet: View {
    let primary: Color
    let land: Color
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                Circle()
                    .fill(primary)
                    .frame(width: proxy.size.width, height: proxy.size.width)
                    .overlay(Land().foregroundColor(land))
                    .mask(Circle())
            }
        }
    }
}

struct Planet_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Planet(primary: .blue, land: .green)
                .padding()
            Planet(primary: .red, land: .gray)
                .padding()
        }
        .background(Color.black)
    }
}
