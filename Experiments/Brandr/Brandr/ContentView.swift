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
    @State var showResults = false

    var body: some View {
        VStack(spacing: 8) {
            Text("Let's get brandrrred")
                .foregroundColor(.trinidad)
                .font(.h1)
                .padding(.bottom, 38)

            HStack {
                Text("What do you do?").font(.h3)
                Spacer()
            }

            HStack {
                Picker("", selection: $model.category) {
                    ForEach(model.categories, id: \.self) { category in
                        HStack {
                            Text(category)
                        }
                        .tag(category)
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(RoundedRectangle(cornerRadius: 8).strokeBorder())
                .accentColor(.midnightBlack)
                .pickerStyle(.menu)

                Spacer()
            }
            .padding(.bottom)

            HStack {
                Text("Describe your brand").font(.h3)
                Spacer()
            }

            TextField("Brand keywords", text: $model.keywords, prompt: nil)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom)

                Button("Next", action: { showResults = true })
                    .buttonStyle(FilledButton())
                    .primaryColor(.trinidad)
                    .secondaryColor(.pearlyWhite)
                    .disabled(false)

            NavigationLink("", destination: ResultsView(model: model), isActive: $showResults)
        }
        .foregroundColor(.midnightBlack)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color.pearlyWhite)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices(combos: .defaults) {
            ContentView()
        }
//        .environment(\.sizeCategory, .accessibilityLarge)
    }
}
