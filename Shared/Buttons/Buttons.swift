//
//  Buttons.swift
//  Catalog (iOS)
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI
import Props

//protocol Prop {
//    associatedtype Body : View
//    var name: String { get }
//    var notes: String? { get }
//    @ViewBuilder var body: Self.Body { get }
//}
//
////protocol Prop {
////    var name: String { get }
////    var notes: String? { get }
////    func body() -> AnyView
////}
//
//protocol Categorizable {
//    var category: String { get }
//    var subcategories: [Categorizable] { get }
//    var props: [Prop] { get }
//}
//
//struct ButtonCategory: Categorizable {
//    let category = "Buttons"
//    var subcategories = [Categorizable]()
//    var props = [Prop]()
//}
//
//struct ButtonProp: Prop {
//    let name: String
//    let notes: String?
//    var sample: () -> AnyView
//    func body() -> AnyView {
//        AnyView(
//            VStack {
//                sample()
//                sample().disabled(true)
//            }
//        )
//    }
//}

struct Buttons: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("MaterialButtonStyles").font(.title)
                MaterialButtonStyles()

                Divider()
                    .padding(.top, 30)

                Text("ButtonStyles").font(.title)
                ButtonStyles()

                Divider()
                    .padding(.top, 30)

                Text("SystemButtonStyles").font(.title)
                SystemButtonStyles()
                    .padding(.bottom, 100)

            }
            .padding()
            .navigationTitle("Buttons")
        }
    }
}

struct AllButtonStyles: View {
    var body: some View {
        VStack {
            ButtonStyles()
            SystemButtonStyles()
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices {
            Buttons()
        }
    }
}
