//
//  Extensions.swift
//  TriviaGame
//
//  Created by Ovidio  on 12/28/21.
//

import Foundation
import SwiftUI


extension Text {
    func mainTitle() -> some View {
        self
            .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}

extension VStack {
    func backgroundModifier() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(.init(white: 0, alpha: 0.08)))
}
}
