//
//  PrimaryButton.swift
//  TriviaGame
//
//  Created by Ovidio  on 12/28/21.
//

import SwiftUI

struct PrimaryButton: View {
    let buttonTitle: String
    var buttonBackground: Color = Color("AccentColor")
    var body: some View {
        Text(buttonTitle)
            .foregroundColor(.white)
            .frame(maxWidth: 250)
            .frame(height: 55)
            .background(buttonBackground)
            .cornerRadius(30)
            .shadow(radius: 10)
            .padding()
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(buttonTitle: "Next")
    }
}
