//
//  TriviaManager.swift
//  TriviaGame
//
//  Created by Ovidio  on 1/5/22.
//

import Foundation
import SwiftUI



class TriviaManager: ObservableObject {
    //Storing the data from the API call
    //This variable is NOT published because we will create other published variables that'll fulfill this role
    private(set) var trivia: [Result] = []
    
    //This variable is necessary to track the length of the array
    //The length of the array coincides with the number of total questions
    @Published private(set) var length = 0
    
    //Let's you know the current index of the results array of the trivia
    //It is zero by default because we want to start with the first question of the array
    @Published private(set) var index = 0
    
    //Let's the user know if they have reached the end of the array (finished the game)
    @Published private(set) var reachedEnd = false
    
    //Let's us know if the user has selected an answer
    @Published private(set) var answerSelected = false
    
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [AnswerChoices] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    
    init() {
        Task.init {
           await getTrivia()
        }
    }
    
    func getTrivia() async {
        guard let url = URL(string: APIEndpoint.url)
                        else {fatalError("Error finding url")}
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200
            else {throw APIError.unknown}
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Trivia.self, from: data)
            
            DispatchQueue.main.async {
                self.score = 0
                self.index = 0
                self.progress = 0.0
                self.reachedEnd = false
                
                self.trivia = decodedData.results
                self.length = self.trivia.count
                self.setQuestion()
            }
        } catch {
            print("Fatal error has occurred \(error.localizedDescription)")
        }
    }
    
    
    func setQuestion() {
        answerSelected = false
        //We use 350 because this is the total width of the progress bar in our UI
        withAnimation(.spring()) {
            progress = CGFloat(Double(index + 1) / Double(length) * 350)
        }
        
        if index < length {
            let currentQuestion = trivia[index]
            
            question = currentQuestion.formattedQuestion
            answerChoices = currentQuestion.answers
        }
    }
    
    func goToNextQuestion() {
        //if this conditional is true, we can safely increment our array
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func selectAnswer(answer: AnswerChoices) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
}
