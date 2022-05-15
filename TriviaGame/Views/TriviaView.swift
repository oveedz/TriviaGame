//
//  TriviaView.swift
//  TriviaGame
//
//  Created by Ovidio  on 12/31/21.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var vm: TriviaManager
    var body: some View {
        if vm.reachedEnd {
            VStack (spacing: 20) {
                Text("Trivia Game")
                    .mainTitle()
                
                Text("Congratulations, you finished!")
                
                Text("You scored: \(vm.score) out of \(vm.length)")
                
                Button {
                    Task.init {
                        await vm.getTrivia()
                    }
                } label: {
                    PrimaryButton(buttonTitle: "Play Again")
                }
            }
            .backgroundModifier()
            .padding()
            .foregroundColor(Color("AccentColor"))
        } else {
            QuestionView()
                .environmentObject(vm)
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}
