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
        VStack {
            HStack {
                button(for: .Mercury)
                button(for: .Venus)
                button(for: .Earth)
                button(for:. Mars)
            }
            HStack {
                button(for: .Saturn)
                button(for: .Jupiter)
                button(for: .Neptune)
                button(for:. Uranus)
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
            configuration.label
                .foregroundColor(selected ? Color("BrandGradientStart") : .white)
                .frame(width: 75, height: 75)
                .background(
                    ZStack {
                        Circle()
                            .fill(Color(white: 1, opacity: selected ? 1 : 0))
                        Circle()
                            .strokeBorder(selected ? Color.white : Color("BrandGradientStart"), lineWidth: 1.5)
                    }
                )
                .opacity(configuration.isPressed ? 0.5 : 1.0)
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
