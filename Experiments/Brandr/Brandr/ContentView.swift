//
//  ContentView.swift
//  Brandr
//
//  Created by Quinn McHenry on 11/4/21.
//

import SwiftUI
import SPBrand
import Props

struct ContentView: View {
    @StateObject var model = ViewModel()
    @ScaledMetric(relativeTo: .body) var scaledPadding: CGFloat = 10

    var body: some View {
        VStack(spacing: 20) {
            Group {
                Text("Hello, ")
                + Text("____").kerning(-12)
                + Text(" !")
            }
            .foregroundColor(.trinidad)
            .font(.h1)

            Text("Category").font(.h3)

            Picker("", selection: $model.category) {
                ForEach(model.categories, id: \.self) { category in
                    HStack {
                        Image(systemName: "person.fill")
                        Text(category)
                    }
                    .tag(category)
                }
            }
            .accentColor(.pearlyWhite)

            Text("Query").font(.h3)

            TextField("Brand keywords", text: $model.keywords, prompt: nil)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            NavigationLink(destination: ResultsView(model: model)) {
                Text("Next!")
            }

//            Button {
//                NavigationLink("", destination: ResultsView())
//            } label: {
//                Text("Next ->")
//            }
//            .buttonStyle(MonochromaricMaterial(color: .trinidad))

        }
        .foregroundColor(.pearlyWhite)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color.forestGreen)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices {
            ContentView()
        }
//        .environment(\.sizeCategory, .accessibilityLarge)
    }
}
