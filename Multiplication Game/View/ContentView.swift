//
//  ContentView.swift
//  Multiplication Game
//
//  Created by Hanna Cherniakova on 28/04/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var myViewModel: ViewModel
    
    var body: some View {
        if myViewModel.isGameStarted {
            GameView()
        }else {
            ZStack {
                Text("🐒")
                    .rotationEffect(Angle(degrees: 45))
                    .font(.system(size: 100))
                    .position(x: 100, y: 50)
                Text("🙊")
                    .rotationEffect(Angle(degrees: -45))
                    .font(.system(size: 100))
                    .position(x: 300, y: 100)
                Text("🐵")
                    .rotationEffect(Angle(degrees: -15))
                    .font(.system(size: 70))
                    .position(x: 100, y: 600)
                VStack {
                    Text("Table:")
                        .padding()
                        .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                        .font(.title)
                        .bold()
                    
                    PickerViewMain(number: $myViewModel.number)
                    
                    Text("Number of questions:")
                        .padding()
                        .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                        .font(.title)
                        .bold()
                    
                    PickerViewSecondary(numberOfQuestions: $myViewModel.numberOfQuestions)
                    
                    Button("Start game") {
                        myViewModel.isGameStarted = true
                        myViewModel.questionsGenerator()
                    }
                    .buttonStyle(.bordered)
                    .background(.yellow)
                    .cornerRadius(50)
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel()) 
    }
}
