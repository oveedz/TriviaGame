//
//  CategoriesView.swift
//  TriviaGame
//
//  Created by Ovidio  on 5/12/22.
//

import SwiftUI

struct CategoriesView: View {
    var categories: Result
    var body: some View {
        Text(categories.category)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(categories: .dummyData.first!)
    }
}
