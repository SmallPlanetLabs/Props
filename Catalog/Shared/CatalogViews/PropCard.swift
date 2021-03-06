//
//  PropCard.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/15/21.
//

import SwiftUI

struct PropCard: View {
    let sample: PropSampleable
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(sample.name)
            Spacer()
            HStack {
                Spacer()
                sample.body
                Spacer()
            }
            Spacer()
            if let notes = sample.notes {
                Text(notes)
                    .font(.footnote)
                    .fixedSize(horizontal: false, vertical: true)
            }
            Text(sample.source)
                .font(.footnote)
        }
        .padding()
        .frame(minHeight: 340)
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct PropCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PropCard(sample: DefaultButtonSample())
            PropCard(sample: BorderedButtonSample())
            PropCard(sample: BorderedProminentButtonSample())
        }
        .padding()
    }
}
