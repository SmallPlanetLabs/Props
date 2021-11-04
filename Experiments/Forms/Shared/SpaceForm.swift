//
//  SpaceForm.swift
//  Forms
//
//  Created by Quinn McHenry on 11/1/21.
//

import SwiftUI
import Combine
import Props
import Sliders
import SwiftUIFlowLayout

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
                        .textFieldStyle(SpaceTextFieldStyle(field: .name))
                        .focused($focus, equals: .name)
                    
                    if model.isNameDone {
                        SpaceField(title: "Age")
                            .font(.system(size: 11, weight: .light))
                        Group {
                            HStack(alignment: .firstTextBaseline) {
                                Text("\(Int(model.age))").monospacedDigit()
                                Text("Earth years")
                                if !model.isAgeDone {
                                    Spacer()
                                    Text("Must be 18+ to continue")
                                        .font(.system(size: 10, weight: .light))
                                }
                            }
                            ValueSlider(value: $model.age, in: 0...100)
                                .valueSliderStyle(
                                    HorizontalValueSliderStyle(track: Color("BrandGradientStart").tinted(amount: 0.25).frame(height: 3).cornerRadius(1.5))
                                )
                                .accentColor(Color("BrandGradientStart"))
                        }
                        .padding(.horizontal)
                    }
                    
                    if model.isAgeDone {
                        SpaceField(title: "Planet")
                            .font(.system(size: 11, weight: .light))
                        
                        PlanetPicker(planet: $model.planet)
                    }
                    
                    if model.isAgeDone && model.isPlanetDone {
                        SpaceField(title: "Interests")
                            .font(.system(size: 11, weight: .light))
                        
                        FlowLayout(mode: .scrollable,
                                   items: [ Toggle("Star gazing", isOn: $model.interest0),
                                            Toggle("Moon naming", isOn: $model.interest1),
                                            Toggle("Cooking", isOn: $model.interest2),
                                            Toggle("Cloud surfing", isOn: $model.interest3),
                                            Toggle("Piloting rovers", isOn: $model.interest4),
                                            Toggle("Ring counting", isOn: $model.interest5),
                                            Toggle("Moisture farming", isOn: $model.interest6)],
                                   itemSpacing: 4) { $0 }
                                   .toggleStyle(.button)
                        
                                   .padding(.horizontal)
                        
                        SpaceField(title: "Open to travel") // this seems redundant
                            .font(.system(size: 11, weight: .light))
                        Toggle("Are you open to travel?", isOn: $model.openToTravel)
                            .toggleStyle(CheckBoxStyle())
                            .accentColor(Color("BrandGradientStart"))
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
            MultipleDevices(enabled: true) {
                SpaceForm()
            }
            .environmentObject(SpaceFormModel(name: "Sally", age: 27, planet: .Mars))
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
