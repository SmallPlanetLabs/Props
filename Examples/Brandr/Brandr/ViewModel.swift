//
//  ViewModel.swift
//  Brandr
//
//  Created by Quinn McHenry on 11/5/21.
//

import Foundation
import Combine
import SwiftUI

final class ViewModel: ObservableObject {
    let totalBrands = 100
    @Published var category: String?
    @Published var keywords = ""
    @Published var brands = [String]()

    let categories = [
        "Choose discipline",
        "Architecture",
        "Interior Design",
        "UX & UI",
        "Research & Strategy",
        "Creative Writing",
        "Marketing",
        "Animation",
        "Product Design",
        "Game Design",
        "Mobile App Development"
    ]

    init(category: String = "Architecture", keywords: String = "") {
        self.category = categories.first
        self.keywords = keywords

        $category
            .compactMap{ $0 }
            .combineLatest($keywords)
            .removeDuplicates(by: { $0 == $1 })
            .map { self.makeBrands(category: $0, keywords: $1) }
            .print("Brands")
            .assign(to: &$brands)
    }

    func makeBrands(category: String, keywords: String) -> [String] {
        let terms = categoryTerms[category] ?? []
        let keyword: String? = keywords.isEmpty ? .none : keywords

        func random() -> [String?] {
            switch Int.random(in: 0...3) {
            case 1:
                return [terms.randomElement(), keyword]
            case 2:
                return [keyword, terms.randomElement()]
            case 3:
                return [adjectives.randomElement(), keyword]
            default:
                return [keyword, adjectives.randomElement()]
            }
        }
        return (0..<totalBrands).map { _ in
            random().compactMap({ $0 }).joined(separator: " ").capitalized
        }
    }

    let categoryTerms: [String: [String]] = [
        "Architecture": ["structure", "design", "layout", "structural", "building", "built", "edifice", "system", "construct", "arch", "🏛"],
        "Interior Design": ["decor","decorate", "motel", "decorator", "gallery", "futurism", "stylist", "dabble", "dabbling", "art", "designer", "eye", "🖼"],
        "UX & UI": ["trust", "multimedia", "simple", "mechanic", "something", "user", "experience", "design", "simple", "controls"],
        "Research & Strategy": ["scheme", "plan", "approach", "tactic", "gambit", "stratagem", "vision", "concept", "initiative", "agenda", "playbook", "framework", "♟"],
        "Creative Writing": ["inspiration", "composition", "literary", "legwork", "literate", "artist", "author", "copyright", "energy", "establishment", "original", "✏️"],
        "Marketing": ["advertising", "promotional", "marketer", "sales", "product", "business", "promotion", "outreach", "publicity", "marketplace", "commercial", "campaign", "advertisement", "promote", "📈"],
        "Animation": ["liveliness", "vivifying", "aliveness", "life", "invigoration", "animated", "cartoon", "film", "movie", "comic", "entertainment"],
        "Product Design": ["merchandise", "production", "wares", "intersection", "brand", "marketing", "packaging", "marketplace", "appliance", "ingredient", "manufacture", "device", "market", "✖️"],
        "Game Design": ["gritty", "gamey", "gage", "fearless", "spirited", "spunky", "stake", "mettlesome", "gamy", "biz", "courageous", "play", "match", "matches", "playing", "tournament", "👾"],
        "Mobile App Development": ["nomadic", "roving", "movable", "ambulatory", "informatics", "compute", "programming", "programs", "sourceworks", "package", "📱"]
    ]

    let adjectives = ["alluring", "bountiful", "brilliant", "breathtaking", "dazzling", "elegant", "enchanting", "gleaming", "glimmering", "glistening", "glittering", "glowing", "lovely", "lustrous", "magnificent", "ravishing", "shimmering", "shining", "sleek", "sparkling", "twinkling", "vivid", "vibrant", "vivacious"]
}

