//
//  ContentView.swift
//  TriviaGame
//
//  Created by Ovidio  on 12/28/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = TriviaManager()
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("The Ultimate Trivia Game")
                        .mainTitle()
                        
                    Text("Are you ready?")
                        .foregroundColor(Color("AccentColor"))
                }
                NavigationLink{
                    TriviaView()
                        .environmentObject(vm)
                } label: {
                    PrimaryButton(buttonTitle: "Start")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(.init(white: 0, alpha: 0.1)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
