//
//  CategoriesView.swift
//  TriviaGame
//
//  Created by Ovidio  on 5/12/22.
//

import SwiftUI

struct CategoriesView: View {
    var trivia: Result
    var body: some View {
        Text(trivia.category)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(trivia: .dummyData.first!)
    }
}
