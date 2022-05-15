//
//  Answer.swift
//  TriviaGame
//
//  Created by Ovidio  on 12/28/21.
//

import Foundation

struct AnswerChoices: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
