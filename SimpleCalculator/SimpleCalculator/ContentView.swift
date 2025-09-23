//
//  ContentView.swift
//  SimpleCalculator
//
//  Created by Evander Martez Blue on 9/22/25.
//

import SwiftUI

struct ContentView: View {
    @State private var input1 = ""
    @State private var input2 = ""
    @State private var result = ""
    
    
    
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Simple Calculator")
                .font(.largeTitle)
                .padding()
            
            TextField("Enter first number", text: $input1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Enter second number", text: $input2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack(spacing: 15) {
                Button("+") {calculate("+") }
                Button("-") {calculate("-") }
                Button("*") {calculate("*") }
                Button("÷") {calculate("/") }
            }
            .buttonStyle(.borderedProminent)
            
            Text("Result: \(result)")
                .font(.title2)
                .padding()
            
        }
        .padding()
    }
    
    private func calculate(_ operation: String) {
        guard let num1 = Double(input1), let num2 = Double(input2) else {
            result = "Invalid input"
            return
        }
        
        switch operation {
        case "+": result = String(num1 + num2)
        case "-": result = String(num1 - num2)
        case "*": result = String(num1 * num2)
        case "/": result = String(num1 / num2)
        default: break
            
        }
    }
    

    struct CalculatorApp: App {
        var body: some Scene {
            WindowGroup {
                ContentView()
            }
        }
    }
}
