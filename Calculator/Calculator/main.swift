//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation
print("please enter an equation")
let userInput = readLine()!
let components = userInput.components(separatedBy: " ")
print(components)

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
var mathOperation = mathStuffFactory(opString: components[1])

//calculate result using closure returned from mathStuffFactory

var firstNum = Double()
var secondNum = Double()
if let firstNumber = Double(components[0]) {
    firstNum = firstNumber
}
if let secondNumber = Double(components[2]) {
    secondNum = secondNumber
}
let result = mathOperation(firstNum,secondNum)
print("\(userInput) = \(result)")
