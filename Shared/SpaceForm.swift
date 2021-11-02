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
    @FocusState private var focus: SpaceFormModel.Field?
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

                    TextField(SpaceFormModel.Field.name.title, text: $model.name, onCommit: {
                        self.model.isNameDone = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { self.focus = .age }
                    })
//                        .textFieldStyle(.roundedBorder)
                        .textFieldStyle(SpaceTextFieldStyle(field: .name))
                        .focused($focus, equals: .name)
                        .padding()

                    if model.isNameDone {
                        TextField(SpaceFormModel.Field.age.title, text: $model.age, onCommit: {
                            self.model.isAgeDone = true
                            self.focus = .none
                        })
                            .textFieldStyle(SpaceTextFieldStyle(field: .age))
                            .focused($focus, equals: .age)
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
        .onChange(of: model.currentField) { newField in
            focus = newField
        }
    }
}

struct SpaceForm_Previews: PreviewProvider {
    static var previews: some View {
        PreviewDisparateDevices(enabled: false) {
            SpaceForm()
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
