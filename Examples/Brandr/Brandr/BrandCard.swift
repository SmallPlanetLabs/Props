//
//  BrandCard.swift
//  Brandr
//
//  Created by Quinn McHenry on 11/5/21.
//

import SwiftUI

struct BrandCard: View {
    let brand: Brand
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(brand.background)
            Text(brand.name)
                .foregroundColor(brand.foreground)
                .font(brand.font)
                .padding()
        }
    }
}

struct BrandCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            BrandCard(brand: Brand(name: "Brand name here"))
                .frame(width: 240, height: 160)
            BrandCard(brand: Brand(name: "Brand name here"))
                .frame(width: 240, height: 160)
            BrandCard(brand: Brand(name: "Brand name here"))
                .frame(width: 240, height: 160)
            BrandCard(brand: Brand(name: "Brand name here"))
                .frame(width: 240, height: 160)
        }
    }
}
