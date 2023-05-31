//
//  PickerView.swift
//  Multiplication Game
//
//  Created by Hanna Cherniakova on 28/04/2023.
//

import SwiftUI

struct PickerViewMain: View {
    @Binding var number: Int
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0...4, id: \.self) { int in
                    logic(int: int)
                        .onTapGesture {
                            number = int
                        }
                }
                .padding(5)
            }
            
            HStack {
                ForEach(5...10, id: \.self) { int in
                    logic(int: int)
                        .onTapGesture {
                            number = int
                        }
                }
                .padding(5)
            }
        }
        .foregroundColor(.yellow)
        .font(.largeTitle)
    }
    
    func logic(int: Int) -> Image {
        if int == number {
            return Image(systemName: "\(int).circle.fill")
        }else {
            return Image(systemName: "\(int).circle")
        }
    }
}

struct PickerViewSecondary: View {
    @Binding var numberOfQuestions: Int
    @State private var questions = [5,10,20]
    
    var body: some View {
        HStack {
            ForEach(questions, id: \.self) { int in
                viewLogic(int: int)
                    .onTapGesture {
                        numberOfQuestions = int
                    }
            }
            .padding(5)
        }
        .foregroundColor(.yellow)
        .font(.largeTitle)
    }
    
    func viewLogic(int: Int) -> Image {
        if int == numberOfQuestions {
            return Image(systemName: "\(int).circle.fill")
        }else {
            return Image(systemName: "\(int).circle")
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerViewMain(number: .constant(9))
    }
}
