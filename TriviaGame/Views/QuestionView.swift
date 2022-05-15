//
//  QuestionView.swift
//  TriviaGame
//
//  Created by Ovidio  on 12/28/21.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var vm: TriviaManager
    var body: some View {
            VStack(spacing: 40) {
                header
                    .padding(.horizontal, 36)
                
                ProgressBar(progress: vm.progress)
                    .padding(.horizontal, 38)
                
                questions
                    .padding(.horizontal, 36)
                
                nextButton
                    .disabled(!vm.answerSelected)
                            
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.init(white: 0, alpha: 0.1)))
            .navigationBarHidden(true)
    }
    
    private var header: some View {
        HStack {
            Text("Trivia Game")
                .mainTitle()
            Spacer()
            Text("\(vm.index + 1) out of \(vm.length)")
                .foregroundColor(Color("AccentColor"))
                .fontWeight(.heavy)
        }
    }
    
    private var questions: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(vm.question)
                .font(.system(size: 20))
                .fontWeight(.heavy)
                .foregroundColor(.gray)
          
            ForEach(vm.answerChoices, id: \.id) { answer in
                AnswerBox(answer: answer)
                    .environmentObject(vm)
            }
        
        }
    }
    
    private var nextButton: some View {
        Button {
            vm.goToNextQuestion()
        } label: {
            PrimaryButton(buttonTitle: "Next",
                          buttonBackground: vm.answerSelected ?
                          Color("AccentColor") : Color(hue: 1.0, saturation: 0.0,
                                                       brightness: 0.5, opacity: 0.3))
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaManager())
    }
}
