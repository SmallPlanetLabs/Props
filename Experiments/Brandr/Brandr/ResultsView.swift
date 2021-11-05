//
//  ResultsView.swift
//  Brandr
//
//  Created by Quinn McHenry on 11/5/21.
//

import SwiftUI

struct ResultsView: View {
    @ObservedObject var model: ViewModel
    var body: some View {

        let gridItems = [GridItem(.adaptive(minimum: 150, maximum: .infinity), spacing: 10)]

        VStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: gridItems, spacing: 10) {
                    ForEach(model.brands, id: \.self) { brand in
                        BrandCard(brand: Brand(name: brand))
                            .frame(height: 120)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .foregroundColor(.midnightBlack)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color.pearlyWhite)
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(model: ViewModel(keywords: "cat napping"))
    }
}
