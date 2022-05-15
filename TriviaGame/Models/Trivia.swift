//
//  Trivia.swift
//  TriviaGame
//
//  Created by Ovidio  on 1/2/22.
//

import Foundation


struct Trivia: Decodable {
    var results: [Result]
}

struct Result: Decodable, Identifiable {
    var id: UUID {
        UUID()
    }
    var category: String
    var type: String
    var difficulty: String
    var question: String
    var correctAnswer: String
    var incorrectAnswers: [String]
    
    var formattedQuestion: AttributedString {
        do {
            return try AttributedString(markdown: question)
        } catch {
            print("Error retrieving formatted question. Error type: \(error)")
            return ""
        }
    }
    
    var answers: [AnswerChoices] {
        do {
            let correct = [AnswerChoices(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
            let incorrect = try incorrectAnswers.map { answer in
                AnswerChoices(text: try AttributedString(markdown: answer), isCorrect: false)
            }
            let allAnswers = correct + incorrect
            return allAnswers.shuffled()
        } catch {
            print("Error retrieving answers: \(error)")
            return []
        }
    }
}

extension Result {
    static let dummyData: [Result] = [
        .init(category: "Anime",
              type: "Multiple Choice",
              difficulty: "Hard", question: "",
              correctAnswer: "true",
              incorrectAnswers: [""])
    ]
}
