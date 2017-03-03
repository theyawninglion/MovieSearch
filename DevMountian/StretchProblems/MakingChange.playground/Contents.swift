//: Playground - noun: a place where people can play

import UIKit

func makingChange(money: Double) {
    
    let moneyInCents = Int(money * 100)
    
    let dollars = moneyInCents / 100
    
    let quarters = (moneyInCents - dollars * 100) / 25
    
    let dimes = ((moneyInCents - dollars * 100) - (quarters * 25)) / 10
    
    let nickels = ((moneyInCents - dollars * 100) - (quarters * 25) - (dimes * 10)) / 5
    
    let pennies = (moneyInCents - dollars * 100) - (quarters * 25) - (dimes * 10) - (nickels * 5)
    
    print("Your change is \(dollars) dollars, \(quarters) quarters, \(dimes) dimes, \(nickels), nickels, and \(pennies) pennies.")
    
}


makingChange(money: 8777.98)