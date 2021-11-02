//
//  TextFieldStyles.swift
//  Forms
//
//  Created by Quinn McHenry on 11/1/21.
//

import SwiftUI

struct SpaceTextFieldStyle: TextFieldStyle {
    let field: SpaceFormModel.Field
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(field.title)
                .font(.system(size: 11, weight: .light))
            configuration
                .cornerRadius(20)
                .shadow(color: .gray, radius: 10)
        }
        .padding()
    }
}
