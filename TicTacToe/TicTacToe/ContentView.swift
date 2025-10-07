//
//  ContentView.swift
//  TicTacToe
//
//  Created by Evander Martez Blue on 10/2/25.
//

import SwiftUI

class TicTacToeGame: ObservableObject {
    @Published var board = Array(repeating: " ", count: 9)
    @Published var currentPlayer: String = "X"
    @Published var winner: String? = nil
    @Published var gameOver = false
    
}

#Preview {
    ContentView()
}
