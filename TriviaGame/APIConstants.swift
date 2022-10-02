//
//  APIConstants.swift
//  TriviaGame
//
//  Created by Ovidio  on 5/12/22.
//

import Foundation


enum APIEndpoint {
    static let url = "https://opentdb.com/api.php?amount=10"
}
enum APIError: LocalizedError {
    case decodingError, errorCode(Int), unknown
    
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Error decoding object from the service."
        case .errorCode(let code):
            return "Something went wrong: \(code)"
        case .unknown:
            return "An unknown error has occurred."
        }
    }
}

