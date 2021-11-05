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
        ScrollView {
            VStack {
                ForEach(model.brands, id: \.self) { brand in
                    Text(brand)
                        .font(.h3)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .foregroundColor(.midnightBlack)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color.pearlyWhite)
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(model: ViewModel(keywords: "cat napping"))
    }
}
