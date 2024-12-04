//
//  main.swift
//  Calculadora
//
//  Created by Emanuel Gonzalez on 12/3/24.
//

import Foundation

func performCalculation() {
    
    func getValidatedInput(prompt: String) -> Double {
        while true {
            print(prompt, terminator: "")
            if let input = readLine(), let value = Double(input) {
                return value
            } else {
                print("Invalid input. Please enter a valid number.")
            }
        }
    }
    
    // Step 1: Take input from the user
    print("Welcome to the Calculator!")

    let val1 = getValidatedInput(prompt: "Enter the first number (val1): ")
    let val2 = getValidatedInput(prompt: "Enter the second number (val2): ")
    
    var val3: String

    while true {
        print("Enter an operator (+, -, *, /): ", terminator: "")
        val3 = readLine() ?? ""

        // Check if the input is valid
        if ["+", "-", "*", "/"].contains(val3) {
            break // Exit the loop if valid
        } else {
            print("Invalid input. Please enter one of the following: +, -, *, /.", terminator: "")
        }
    }

    // Step 2: Perform the operation
    var result: Double?

    switch val3 {
    case "+":
        result = val1 + val2
    case "-":
        result = val1 - val2
    case "*":
        result = val1 * val2
    case "/":
        if val2 != 0 {
            result = val1 / val2
        } else {
            print("Error: Division by zero is not allowed.")
        }
    default:
        print("Error: Invalid operator.")
    }

    // Step 3: Output the result
    if let result = result {
        print("Result: \(val1) \(val3) \(val2) = \(result)")
    }

    // Step 4: Ask if user wants to perform another calculation
    print("Do you want to perform another calculation? (yes/no): ", terminator: "")
    let repeatCalc = readLine() ?? ""
    
    if ["yes", "y"].contains(repeatCalc.lowercased()) {
        performCalculation() // Recursively call the function
    } else {
        print("Exiting calculator.")
    }
}

// Start the program
performCalculation()
