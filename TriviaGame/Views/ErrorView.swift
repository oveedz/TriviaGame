//
//  ErrorView.swift
//  TriviaGame
//
//  Created by Ovidio  on 10/2/22.
//

import SwiftUI

struct ErrorView: View {
    internal init(error: Error, handler: @escaping ErrorView.ErrorViewActionHandler) {
        self.error = error
        self.handler = handler
    }
    
    let error: Error
    let handler: ErrorViewActionHandler
    typealias ErrorViewActionHandler = () -> ()
    
    var body: some View {
        
        VStack {
            Spacer()
            Image(systemName: "exclamationmark.icloud.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(Color.accentColor)
            
            Text("\(error.localizedDescription)")
                .font(.title)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button {
                handler()
            } label: {
                PrimaryButton(buttonTitle: "Retry")
            }
        }
        .padding()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError) {}
    }
}
