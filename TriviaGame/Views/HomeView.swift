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
                Spacer()
                
                VStack(spacing: 20) {
                    
                    Image(systemName: "brain")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.accentColor)
                    
                    Text("Trivia Time!")
                        .mainTitle()
                        
                    Text("Ready?")
                        .foregroundColor(Color("AccentColor"))
                }
                
                Spacer()
                
                NavigationLink{
                    TriviaView()
                        .environmentObject(vm)
                } label: {
                    PrimaryButton(buttonTitle: "Get Started")
                }
                .padding()
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
