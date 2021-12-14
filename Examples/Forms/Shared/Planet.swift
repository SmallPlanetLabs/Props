//
//  Planet.swift
//  Forms
//
//  Created by Quinn McHenry on 11/1/21.
//

import SwiftUI

struct PlanetPicker: View {
    @Binding var planet: Planet?

    var body: some View {
        HStack(spacing: 16) {
            Spacer()
            VStack {
                button(for: .Mercury)
                button(for: .Saturn)
            }
            VStack {
                button(for: .Venus)
                button(for: .Jupiter)
            }
            VStack {
                button(for: .Earth)
                button(for: .Neptune)
            }
            VStack {
                button(for:. Mars)
                button(for:. Uranus)
            }
            Spacer()
        }
    }

    struct PlanetOption: View {
        let planet: Planet
        
        var body: some View {
            HStack {
                Text(planet.rawValue).foregroundColor(.white)
            }
        }
    }
    
    @ViewBuilder func button(for planet: Planet) -> some View {
        Button {
            withAnimation {
                self.planet = (self.planet != planet) ? planet : nil
            }
        } label: { Text(planet.rawValue) }
        .buttonStyle(PlanetButtonStyle(planet: planet, selected: planet == self.planet))
    }
}

struct PlanetButtonStyle: ButtonStyle {
    let planet: Planet
    let selected: Bool
    
    public func makeBody(configuration: PlanetButtonStyle.Configuration) -> some View {
        PlanetButton(configuration: configuration, planet: planet, selected: selected)
    }
    
    struct PlanetButton: View {
        let configuration: PlanetButtonStyle.Configuration
        let planet: Planet
        let selected: Bool
        
        var body: some View {
            VStack {
                ZStack {
                    Circle()
                        .fill(Color("BrandGradientStart").opacity(selected ? 1 : 0.001))
                        .shadow(color: Color("BrandGradientStart").shaded(amount:  0.5).opacity(selected ? 0.4 : 0.001), radius: 3, x: -2, y: 2)
                    Circle()
                        .strokeBorder(Color("BrandGradientStart"), lineWidth: 1.5)
                    
                }
                .frame(width: 40, height: 40)
                configuration.label
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                    .opacity(configuration.isPressed ? 0.5 : 1.0)
            }

        }
    }
}


struct Planet_Previews: PreviewProvider {
    static var previews: some View {
        PreviewDisparateDevices {
            PlanetPicker(planet: .constant(.Earth))
                .padding(20)
                .background(Color.gray)
        }
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

//
//struct Planet: View {
//    let primary: Color
//    let land: Color
//    var body: some View {
//        ZStack {
//            GeometryReader { proxy in
//                Circle()
//                    .fill(primary)
//                    .frame(width: proxy.size.width, height: proxy.size.width)
//                    .overlay(Land().foregroundColor(land))
//                    .mask(Circle())
//            }
//        }
//    }
//}
//
//struct Planet_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack {
//            Planet(primary: .blue, land: .green)
//                .padding()
//            Planet(primary: .red, land: .gray)
//                .padding()
//        }
//        .background(Color.black)
//    }
//}
