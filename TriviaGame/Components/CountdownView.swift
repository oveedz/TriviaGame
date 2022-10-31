//
//  CountdownView.swift
//  TriviaGame
//
//  Created by Ovidio  on 10/29/22.
//

import SwiftUI

struct CountdownView: View {
    @EnvironmentObject var vm: TriviaManager

    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text("\(vm.timeRemaining)")
                .font(.title)
                .bold()
                .padding()
                .overlay {
                    Circle()
                        .trim(from: 0, to: vm.circleTrim)
                        .stroke(lineWidth: 5)
                        .rotationEffect(Angle(degrees: 90), anchor: .center)
                        .foregroundColor(Color("AccentColor"))
                }
        }
        .onReceive(timer) { _ in
            if vm.timeRemaining == 0 {
                vm.goToNextQuestion()
                vm.circleTrim = 0.00
                vm.timeRemaining = 10
            } else if vm.answerSelected {
                timer.upstream.connect().cancel()
            } else {
                vm.timeRemaining -= 1
                withAnimation(.spring()) {
                    vm.circleTrim += 0.1
                }
            }
        }
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
            .environmentObject(TriviaManager())
    }
}
