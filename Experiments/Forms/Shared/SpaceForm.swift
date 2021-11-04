//
//  SpaceForm.swift
//  Forms
//
//  Created by Quinn McHenry on 11/1/21.
//

import SwiftUI
import Combine
import Props

struct SpaceForm: View {
    @EnvironmentObject private var model: SpaceFormModel
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
                            .font(.system(size: 11, weight: .light))

                        PlanetPicker(planet: $model.planet)
                            .padding(.leading)
                        Divider().background(Color.black).padding(.horizontal)
                            .padding(.top, 12)
                    }

                    if model.isPlanetDone {
                        SpaceField(title: "Interests")
                            .font(.system(size: 11, weight: .light))

                        SpaceField(title: "Open to travel") // this seems redundant
                            .font(.system(size: 11, weight: .light))
                        Toggle("Are you open to travel?", isOn: $model.openToTravel)
                            .toggleStyle(CheckBoxStyle())
                            .padding()
                        
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
        .environmentObject(SpaceFormModel(name: "Sally", age: "37", planet: .Mars))
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
