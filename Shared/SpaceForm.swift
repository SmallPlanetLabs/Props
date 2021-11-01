//
//  SpaceForm.swift
//  Forms
//
//  Created by Quinn McHenry on 11/1/21.
//

import SwiftUI
import Combine

struct SpaceForm: View {
    @StateObject private var model = SpaceFormModel()
    @State private var name = "Tim"
    var body: some View {

        ZStack(alignment: .top) {
            ScrollView {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Spacer()
                        Text("Edit profile")
                            .font(.system(size: 17, weight: .medium))
                            .padding()
                        Spacer()
                    }
                    .background(.ultraThinMaterial)
                    .overlay(Button(action: { }, label: {} ))

                    SpaceTextField(field: .name, value: $model.name, isDone: $model.isNameDone)
                    if model.isNameDone {
                        SpaceTextField(field: .age, value: $model.age, isDone: $model.isAgeDone)
                    }

                    if model.isAgeDone {
                        SpaceField(title: "Planet")
                        PlanetPicker(planet: $model.planet)
                            .padding(.leading)
                        Divider().background(Color.black).padding(.horizontal)
                            .padding(.top, 12)
                    }

                    if model.isPlanetDone {
                        SpaceField(title: "Interests")
                        SpaceField(title: "Open to travel")
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                // .background(Color(white: 0.1, opacity: 0.2))
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                .padding()
                .padding(.top, 80)
            }

            // Persistent header
            HStack {
                Text("STARS ALIGNED")
                    .font(.system(size: 18, weight: .light))
                    .kerning(3.5)
                    .padding()
            }
            .padding(.top, 50)
            .frame(height: 60)
        }
        .edgesIgnoringSafeArea(.all)
        .foregroundColor(.white)
        .background(model.gradient)
    }
}

struct SpaceForm_Previews: PreviewProvider {
    static var previews: some View {
        PreviewDisparateDevices(enabled: false) {
            SpaceForm()
        }
    }
}

final class SpaceFormModel: ObservableObject {
    @Published var name: String = ""
    @Published var isNameDone = false
    @Published var planet: Planet? = .none
    @Published var isPlanetDone = false
    @Published var age: String = ""
    @Published var isAgeDone = false
    @Published var interests: [String] = []
    @Published var currentField: Field? = .name

    init() {
        $planet
            .map { $0 != nil}
            .assign(to: &$isPlanetDone)
    }


    func isVisisble(field: Field) -> Bool {
        switch field {
        case .name:
            return true
        case .age:
            return !name.isEmpty
        case .location:
            return !age.isEmpty
        case .interests:
            return planet != nil
        case .openToTravel:
            return !interests.isEmpty
        }
    }

    var gradient: LinearGradient {
        LinearGradient(colors: [Color("BrandGradientStart"), planet?.color ?? Color("BrandGradientEnd")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)

    }

    enum Field {
        case name      // fun message after
        case age       // start small (text entry) but could make slider with t
        case interests // 6 for MVP, can select multiple
        case location  // Bool picker
        case openToTravel

        var title: String {
            switch self {
            case .name:
                return "Name"
            case .age:
                return "Age"
            case .interests:
                return "Interests"
            case .location:
                return "Planet"
            case .openToTravel:
                return "Open to travel"
            }
        }

        var placeholder: String {
            switch self {
            case .name:
                return "Solaris Astra"
            case .age:
                return "31 Earth years"
            case .interests:
                return "Interests"
            case .location:
                return "Planet"
            case .openToTravel:
                return "Open to travel"
            }
        }
    }
}

struct SpaceField: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
            Spacer()
//            Image(systemName: "checkmark")
        }
        .padding()
    }
}

struct SpaceTextField: View {
    let field: SpaceFormModel.Field
    @Binding var value: String
    @Binding var isDone: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(field.title)
                .font(.system(size: 11, weight: .light))
                .padding(.bottom, 10)
            HStack {
                TextField(field.placeholder, text: $value, onCommit: { withAnimation { self.isDone = true }})
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
                Image(systemName: "checkmark")
            }

            Divider().background(Color.black)
                .padding(.top, 3)
        }
        .padding()
    }
}

enum Planet: String, CaseIterable {
    case Mercury
    case Venus
    case Earth
    case Mars
    case Saturn
    case Jupiter
    case Neptune
    case Uranus

    var color: Color {
        switch self {
        case .Mercury:
            return Color("GradientEndMercury")
        case .Venus:
            return Color("GradientEndVenus")
        case .Earth:
            return Color("GradientEndEarth")
        case .Mars:
            return Color("GradientEndMars")
        case .Saturn:
            return Color("GradientEndSaturn")
        case .Jupiter:
            return Color("GradientEndJupiter")
        case .Neptune:
            return Color("GradientEndNeptune")
        case .Uranus:
            return Color("GradientEndUranus")
        }
    }
}
