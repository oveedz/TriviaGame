//
//  Answer Row.swift
//  TriviaGame
//
//  Created by Ovidio  on 12/28/21.
//

import SwiftUI

struct AnswerBox: View {
    @EnvironmentObject var vm: TriviaManager
    var answer: AnswerChoices
    @State private var isSelected = false
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            Text(answer.text)
                .bold()
            if isSelected {
                Spacer()

                Image(systemName: answer.isCorrect ? "checkmark.square.fill":"x.square.fill")
                    .foregroundColor(answer.isCorrect ? Color(.green) : Color(.red))
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(vm.answerSelected ?
                        (isSelected ? Color("AccentColor") : .gray) : Color("AccentColor"))
        .background(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? Color(.green) : Color(.red)) : .gray,
                radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !vm.answerSelected {
                isSelected = true
                vm.selectAnswer(answer: answer)
            }
        }
    }
}

struct Answer_Row_Previews: PreviewProvider {
    static var previews: some View {
        AnswerBox(answer: AnswerChoices(text: "Hello", isCorrect: true))
            .environmentObject(TriviaManager())
    }
}

