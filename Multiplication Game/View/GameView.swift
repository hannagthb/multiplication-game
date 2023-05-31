//
//  GameView.swift
//  Multiplication Game
//
//  Created by Hanna Cherniakova on 29/04/2023.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var myViewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(myViewModel.question)
                .foregroundColor(.yellow)
                .font(.largeTitle)

            TextField("Your answer", value: $myViewModel.answer, format: .number)
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
            
            RoundedRectangle(cornerRadius: 1)
                .frame(width: 50, height: 1)
                .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
            
            Button("Answer") {
                myViewModel.checkAnswer()
            }
            .disabled(myViewModel.askedTimes == myViewModel.numberOfQuestions)
            .buttonStyle(.bordered)
            .background(.yellow)
            .cornerRadius(50)
            .foregroundColor(.white)
            .font(.title)
            .padding()
            .alert(myViewModel.message, isPresented: $myViewModel.isAlertShowing) {
                Button("Finish", role: .destructive) {
                    myViewModel.number = 0
                    myViewModel.numberOfQuestions = 0
                    myViewModel.score = 0
                    myViewModel.answer = 0
                    myViewModel.message = ""
                    myViewModel.question = ""
                    myViewModel.askedTimes = 0
                    myViewModel.isGameStarted = false
                }
                if myViewModel.askedTimes != myViewModel.numberOfQuestions {
                    Button("Next question", role: .cancel) {}
                }
            }
            if myViewModel.askedTimes == myViewModel.numberOfQuestions {
                Button("Home") {
                    myViewModel.number = 0
                    myViewModel.numberOfQuestions = 0
                    myViewModel.score = 0
                    myViewModel.answer = 0
                    myViewModel.message = ""
                    myViewModel.question = ""
                    myViewModel.askedTimes = 0
                    myViewModel.isGameStarted = false
                }
            }
            
            Spacer()
            
            Text("🐵👉 Your score is \(myViewModel.score)")
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(ViewModel()) 
    }
}
