//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
    
    switch opString {
    case "+":
        return {x, y in x + y }
    case "-":
        return {x, y in x - y }
    case "*":
        return {x, y in x * y }
    case "/":
        return {x, y in x / y }
    default:
        return {x, y in x + y }
    }
}

func simpleCalculator() {
    
    var double1: Double
    var double2: Double
    
    if let userInput = readLine()?.components(separatedBy: " ") {
        if let checkdouble1 = Double(userInput[0]) {
            double1 = checkdouble1
        } else {
            double1 = 0.0
            print("Invalid input, try again!")
            simpleCalculator()
        }
        
        if let checkdouble2 = Double(userInput[2]) {
            double2 = checkdouble2
        } else {
            double2 = 0.0
            print("Invalid input, try again!")
            simpleCalculator()
        }
        
        let operand = (userInput[1])
        if operand != "+" && operand != "-" && operand != "*" && operand != "/" && operand != "?"{
            print("Invalid operand, try again!")
            simpleCalculator()
        }
        
        if operand == "?" {
            randomOperand(a:double1, b:double2)
        } else {
            let mathOperation = mathStuffFactory(opString: operand)
            let result = mathOperation(double1, double2)
            print("\(double1) \(operand) \(double2) = \(result)")
        }
        
    }
    startMenu()
}


func randomOperand(a:Double, b:Double) {
    let operandList = ["+", "-", "*", "/","?"]
    if let generatedOp = operandList.randomElement() {
        let mathOperation = mathStuffFactory(opString: generatedOp)
        let result = mathOperation(a, b)
        print("\(a) ? \(b) = \(result)")
        print("Which operand did the calculator use?")
        let userInput = readLine()
        if userInput == generatedOp {
            print("You got it correct")
            startMenu()
        } else {
            print("You got it wrong, the operand is \(generatedOp)")
            startMenu()
        }
    }
}


func playGame() {
    print("Enter your calculation e.g 10 ? 5")
    simpleCalculator()
    func randomOperand(a:Double, b:Double) {
        let operandList = ["+", "-", "*", "/","?"]
        if let generatedOp = operandList.randomElement() {
            let mathOperation = mathStuffFactory(opString: generatedOp)
            let result = mathOperation(a, b)
            print("\(a) ? \(b) = \(result)")
            print("Which operand did the calculator use?")
            let userInput = readLine()
            if userInput == generatedOp {
                print("You got it correct")
                startMenu()
            } else {
                print("You got it wrong, the operand is \(generatedOp)")
                startMenu()
            }
        }
    }
}

func highOrderFunc() {
    print("Please enter your high order function e.g filter 1 2 3 4 5 by > 4")
    if let userInput = readLine()?.lowercased().components(separatedBy: " ") {
        if userInput.count != 5 {
            print("Invalid Input")
            highOrderFunc()
        }
        let inputAsComponents = userInput
        let inputArray = inputAsComponents[1].components(separatedBy: ",").compactMap(){Int($0)}
        let inputArrayAsDouble = inputAsComponents[1].components(separatedBy: ",").compactMap(){Double($0)}
        let operand = inputAsComponents[3]
        let givenNum = Double(inputAsComponents[4]) ?? 0
        let givenNumAsDouble = inputAsComponents.compactMap(){Double($0)}
    
    func customMap(inputArray: [Double], map: (Double) -> Double) -> [Double] {
        var anArray = [Double]()
        for number in inputArray {
            let result = map(number)
            anArray.append(result)
        }
        return anArray
    }
    
    
    func customReduce(inputArray: [Double], initialValue: Double, reduce: (Double, Double) -> Double) -> Double {
        var sum = initialValue
        for number in inputArray {
            sum = reduce(sum, number)
        }
        return sum
    }
    
    
    func customFilter(input: [Double], filter: (Double) -> Bool) -> [Double] {
        var emptyArray = [Double]()
        for number in input {
            if filter(number) {
                emptyArray.append(number)
            }
        }
        return emptyArray
    }
    
    switch userInput[0] {
    case "filter":
        if operand == ">"{
            print(customFilter(input: inputArrayAsDouble, filter: {$0 > givenNum}))
        } else {
        if operand == "<" {
                print(customFilter(input: inputArrayAsDouble, filter: {$0 < givenNum}))
        } else {
                print("Invalid option")
            }
        }
    case "map":
        if operand == "*" {
            print(customMap(inputArray: inputArrayAsDouble, map: {$0 * givenNum}))
        } else {
            if operand == "/" {
                print(customMap(inputArray: inputArrayAsDouble, map: {$0 / givenNum}))
        } else {
                print("Invalid entry")
            }
        }
    case "reduce":
        if operand == "+" {
            print(customReduce(inputArray: inputArrayAsDouble, initialValue: inputArrayAsDouble[0], reduce: {$0 + $1}))
        }
    default:
        print("Invalid entry")
        
    }
}
    startMenu()
}

func startMenu(){
    print("If you would like to use the Calculator press [1] , if you would like to play a game press [2]. To use a high order function press [3].")
    let userInput = readLine()?.lowercased()
    switch userInput{
    case "1":
        print("Enter your calculation e.g 10 + 2")
        simpleCalculator()
    case "2":
        playGame()
    case "3":
        highOrderFunc()
    default:
        print("invalid input")
        startMenu()
    }
}

startMenu()
