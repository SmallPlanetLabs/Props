//
//  SpaceFormModel.swift
//  Forms
//
//  Created by Quinn McHenry on 11/1/21.
//

import SwiftUI

final class SpaceFormModel: ObservableObject {
    @Published var name: String = ""
    @Published var isNameDone = false
    @Published var planet: Planet? = .none
    @Published var isPlanetDone = false
    @Published var age: String = ""
    @Published var isAgeDone = true
    @Published var interests: [String] = []
    @Published var openToTravel: Bool = false
    @Published var currentField: Field? = .name

    init(name: String = "", age: String = "", planet: Planet? = .none) {
        $planet
            .map { $0 != nil}
            .assign(to: &$isPlanetDone)

        $isNameDone
            .removeDuplicates()
            .filter { $0 }
            .map { _ in .age }
            .assign(to: &$currentField)

        $age
            .print("age")
            .removeDuplicates()
            .map { !$0.isEmpty }
            .assign(to: &$isAgeDone)

        $isAgeDone
            .removeDuplicates()
            .filter { $0 }
            .map { _ in .none }
            .assign(to: &$currentField)

        self.name = name
        self.age = age
        self.planet = planet
    }

    var gradient: LinearGradient {
        LinearGradient(colors: [Color("BrandGradientStart"), planet?.color ?? Color("BrandGradientEnd")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)

    }

    enum Field: Int, Hashable {
        case name      // fun message after
        case age       // start small (text entry) but could make slider with t
        case location  // Bool picker
        case interests // 6 for MVP, can select multiple
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

        var keyboardType: UIKeyboardType {
            switch self {
            case .name:
                return .namePhonePad
            case .age:
                return .default
            default:
                return .default
            }
        }
    }
}
