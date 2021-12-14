//
//  ContentView.swift
//  Brandr
//
//  Created by Quinn McHenry on 11/4/21.
//

import Lottie
import SwiftUI
import SPBrand
import Props

struct ContentView: View {
    @StateObject var model = ViewModel()
    @ScaledMetric(relativeTo: .body) var scaledPadding: CGFloat = 10
    @State var showResults = false

    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                HStack(spacing: 2) {
                    Image("RedPanda")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 40)
                    Text("Brandit")
                        .foregroundColor(.trinidad)
                        .font(Font.custom("Lora-Bold", size: 20))
                }
                .padding(.bottom, 58)

                Text("Let's Brandit.")
                    .foregroundColor(.midnightBlack)
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
                    .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.trinidad))
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

                Button {
                    showResults = true
                } label: {
                    LottieView(name: "button", loopMode: .loop)
                        .frame(width: 200, height: 200)
                }
                .offset(y: -60)

                NavigationLink("", destination: ResultsView(model: model), isActive: $showResults)

                Spacer()
            }
        }
        .foregroundColor(.midnightBlack)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color.pearlyWhite)
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices(combos: .lightDarkiPhoneBig) {
            NavigationView {
                ContentView()
            }
        }
//        .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
    }
}
