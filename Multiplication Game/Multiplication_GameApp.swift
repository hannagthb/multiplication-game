//
//  Multiplication_GameApp.swift
//  Multiplication Game
//
//  Created by Hanna Cherniakova on 28/04/2023.
//

import SwiftUI

@main
struct Multiplication_GameApp: App {
    let myViewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(myViewModel)
        }
    }
}
