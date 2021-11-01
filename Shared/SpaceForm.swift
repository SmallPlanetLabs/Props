//
//  SpaceForm.swift
//  Forms
//
//  Created by Quinn McHenry on 11/1/21.
//

import SwiftUI

struct SpaceForm: View {
    @StateObject private var model = SpaceFormModel()
    var body: some View {
        let gradient: LinearGradient = LinearGradient(colors: [Color("BrandGradientStart"), Color("BrandGradientEnd")], startPoint: .topLeading, endPoint: .bottomTrailing)

        ZStack(alignment: .top) {
            Planet(primary: .blue, land: .green)
                .offset(x: 200, y: 300)
            ScrollView {
                VStack(alignment: .leading, spacing: 4) {
                    SpaceField(title: "Name")
                    SpaceField(title: "Planet")
                    SpaceField(title: "Age")
//                    ExpandingSpaceField(openField: $model.currentField, field: .name)
//                        .onTapGesture {
//                            withAnimation { model.currentField = .name }
//                        }
//                    Divider()
//                    ExpandingSpaceField(openField: $model.currentField, field: .age)
//                        .onTapGesture {
//                            withAnimation { model.currentField = .age }
//                        }
//                    Divider()
                    SpaceField(title: "About")
                    Group {
                        SpaceField(title: "Interests")
                        SpaceField(title: "Open to travel")
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                .padding()
                .padding(.top, 80)
            }

            // Persistent header
            HStack {
                Text("Branding").font(.title)
                    .padding()
                Spacer()
            }
            .padding(.top, 20)
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

final class SpaceFormModel: ObservableObject {
    @Published var name = ""
    @Published var currentField: Field? = .name

    enum Field {
        case name      // fun message after
        case age       // start small (text entry) but could make slider with t
        case role      // text field (fun response after setting)
        case about
        case interests // 6 for MVP, can select multiple
        case location  // Bool picker
        case openToTravel

        var title: String {
            switch self {
            case .name:
                return "Name"
            case .age:
                return "Age"
            case .role:
                return "Role"
            case .about:
                return "About me"
            case .interests:
                return "Interests"
            case .location:
                return "Planet"
            case .openToTravel:
                return "Open to travel"
            }
        }

        var hint: String {
            switch self {
            case .name:
                return "What should we call you?"
            case .age:
                return "How many galactic solar cycles old are you?"
            case .role:
                return "What do you do when you're doing?"
            case .about:
                return "Tell us all the good stuff!"
            case .interests:
                return "Interests"
            case .location:
                return "Planet/solar system/galaxy/dimension"
            case .openToTravel:
                return "Open to travel"
            }
        }
    }
}

struct SpaceField: View {
//    @Binding var isOpen: Bool
    let title: String
    var body: some View {
        HStack {
            Text(title)
            Spacer()
        }
        .padding()
    }
}

struct ExpandingSpaceField: View {
    @Binding var openField: SpaceFormModel.Field?
    @Binding var completeMessage: String?
    let field: SpaceFormModel.Field
    var body: some View {
        VStack {
            HStack {
                Text(field.title)
                Spacer()
            }
            if openField == field {
                Text(field.hint)
//                Text("Lots of words and things to say about this field, it has a lot of potential content and could get pretty space-y. Get it? `Space`-y? ... oof ... tough crowd.")
//                    .padding()
//                    .background(.thinMaterial)
//                    .cornerRadius(10)
//                    .foregroundColor(.black)
            }
        }
        .padding()
    }
}
