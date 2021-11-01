//
//  SpaceForm.swift
//  Forms
//
//  Created by Quinn McHenry on 11/1/21.
//

import SwiftUI

struct SpaceForm: View {
    var body: some View {
        let gradient: LinearGradient = LinearGradient(colors: [Color("BrandGradientStart"), Color("BrandGradientEnd")], startPoint: .topLeading, endPoint: .bottomTrailing)

        ZStack(alignment: .top) {
            ScrollView {
                VStack(alignment: .leading, spacing: 4) {
                    Spacer(minLength: 60)
                    SpaceField(title: "Name")
                    SpaceField(title: "Age")
                    SpaceField(title: "Role")
                    SpaceField(title: "About")
                    SpaceField(title: "Interests")
                    SpaceField(title: "Planet/Solar system/galaxy")
                    SpaceField(title: "Open to travel")
                    SpaceField(title: "Language")

                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            // Persistent header
            HStack {
                Text("Branding").font(.title)
                    .padding()
                Spacer()
            }
            .frame(height: 60)
        }
        .edgesIgnoringSafeArea(.all)
        .foregroundColor(.white)
        .background(gradient)
    }
}

struct SpaceForm_Previews: PreviewProvider {
    static var previews: some View {
        SpaceForm()
    }
}

struct SpaceField: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
            Spacer()
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(15)
    }
}
