//
//  Land.swift
//  Forms
//
//  Created by Quinn McHenry on 11/1/21.
//

import SwiftUI

struct Land: View {
    @State private var offset: CGFloat = 0
    var body: some View {
        VStack {
            HStack(spacing: 60) {
                Capsule().frame(width: 320)
                Capsule().frame(width: 120)
                Capsule().frame(width: 520)
                Capsule().frame(width: 120)
                Capsule().frame(width: 320)
            }
            .frame(height: 20)
            HStack(spacing: 40) {
                Capsule().frame(width: 120)
                Capsule().frame(width: 220)
                Capsule().frame(width: 320)
                Capsule().frame(width: 120)
                Capsule().frame(width: 520)
            }
            .frame(height: 40)
            HStack(spacing: 90) {
                Capsule().frame(width: 320)
                Capsule().frame(width: 320)
                Capsule().frame(width: 120)
                Capsule().frame(width: 420)
                Capsule().frame(width: 220)
            }
            .frame(height: 80)
            .padding()
            HStack(spacing: 60) {
                Capsule().frame(width: 220)
                Capsule().frame(width: 120)
                Capsule().frame(width: 420)
                Capsule().frame(width: 120)
                Capsule().frame(width: 420)
            }
            .frame(height: 30)
            HStack(spacing: 40) {
                Capsule().frame(width: 120)
                Capsule().frame(width: 220)
                Capsule().frame(width: 320)
                Capsule().frame(width: 120)
                Capsule().frame(width: 520)
            }
            .frame(height: 40)
            .padding()
        }
        .offset(x: offset, y: 0)
        .onAppear {
            let baseAnimation = Animation.easeInOut(duration: 30)
            let repeated = baseAnimation.repeatForever(autoreverses: true)

            withAnimation(repeated) {
                offset = 600
            }
        }
    }
}

struct Land_Previews: PreviewProvider {
    static var previews: some View {
        Land()
            .foregroundColor(.green)
    }
}
