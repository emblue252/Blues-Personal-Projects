//
//  ContentView.swift
//  SimpleCalculator
//
//  Created by Evander Martez Blue on 9/22/25.
//

import SwiftUI

struct ContentView: View {
    @State private var display = "0"                 // What shows on screen
    @State private var equationDisplay: String = ""
    @State private var previousDisplay: String = ""
    @State private var firstOperand: Double? = nil   // Stores the first number
    @State private var currentOperator: String? = nil // +, −, ×, ÷
    @State private var isTypingSecondOperand = false // Tracks if we're typing 2nd number

    var body: some View {
        VStack(alignment: .trailing, spacing: 5) {
            // Display screen
            
            Text(previousDisplay)
                .font(.system(size: 24))
                .foregroundColor(.gray)
            
            
            Text(display)
                .font(.system(size: 48, weight: .bold))
            
            
            // Number pad
            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    digitButton("7")
                    digitButton("8")
                    digitButton("9")
                    operatorButton("÷")
                }
                HStack(spacing: 15) {
                    digitButton("4")
                    digitButton("5")
                    digitButton("6")
                    operatorButton("×")
                }
                HStack(spacing: 15) {
                    digitButton("1")
                    digitButton("2")
                    digitButton("3")
                    operatorButton("−")
                }
                HStack(spacing: 15) {
                    digitButton("0")
                    Button(".") { appendDigit(".") }
                        .frame(width: 60, height: 60)
                        .buttonStyle(.borderedProminent)

                    Button("Clear") { clear() }
                        .frame(width: 60, height: 60)
                        .buttonStyle(.borderedProminent)

                    operatorButton("+")
                }
                HStack {
                    Button("=") { calculateResult() }
                        .frame(width: 250, height: 60) // Wide = button
                        .buttonStyle(.borderedProminent)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding()
    }

    // MARK: - Button Helpers

    private func digitButton(_ digit: String) -> some View {
        Button(digit) { appendDigit(digit) }
            .frame(width: 60, height: 60)
            .buttonStyle(.borderedProminent)
    }

    private func operatorButton(_ op: String) -> some View {
        Button(op) { selectOperator(op) }
            .frame(width: 60, height: 60)
            .buttonStyle(.borderedProminent)
    }

    // MARK: - Logic

    private func appendDigit(_ digit: String) {
        if isTypingSecondOperand {
            display = digit
            isTypingSecondOperand = false
        } else {
            if display == "0" && digit != "." {
                display = digit
            } else {
                display += digit
            }
        }
    }

    private func selectOperator(_ op: String) {
        firstOperand = Double(display)
        currentOperator = op
        previousDisplay = "\(display) \(op)"
        isTypingSecondOperand = true
        
    }

    private func calculateResult() {
        guard let first = firstOperand,
              let op = currentOperator,
              let second = Double(display) else { return }
              let firstNumberString = String(Int(first))
              let decimalRequired: Bool
        
        if firstNumberString.contains(".")  || display.contains(".") {
            decimalRequired = true
        } else {
            decimalRequired = false
        }

        var result: Double = 0
        switch op {
        case "+": result = first + second
        case "−": result = first - second
        case "×": result = first * second
        case "÷": result = second != 0 ? first / second : Double.nan
        default: break
        }
        
        let formattedResult: String
        if decimalRequired {
            formattedResult = String(result)
        } else {
            formattedResult = String(Int(result))
        }
        
        display = formattedResult
        previousDisplay = ""
        firstOperand = result
        currentOperator = nil
        isTypingSecondOperand = true
        
    }

    private func clear() {
        firstOperand = nil
        currentOperator = nil
        isTypingSecondOperand = false
        
        display = "0"
        previousDisplay = ""
    }
}
