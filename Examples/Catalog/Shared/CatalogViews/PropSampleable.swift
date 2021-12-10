//
//  PropSampleable.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/15/21.
//

import SwiftUI

protocol PropSampleable {
    var name: String { get }
    var notes: String? { get }
    var source: String { get }
    var keywords: String { get }
    var body: AnyView { get }
}
