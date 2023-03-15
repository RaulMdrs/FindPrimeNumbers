//
//  FindTheCousins.swift
//  FindTheCousins
//
//  Created by Raul de Medeiros on 15/03/23.
//

import Foundation

struct FindTheCousins {
    static func findPrimes(number : String) -> [Int]{
        let num = FindTheCousins.transformInt(num: number)
        var cousins : [Int] = []
        
        for i in 0...num {
            if FindTheCousins.isPrime(value: i) == true {
                cousins.append(i)
            }
        }
        
        return cousins
    }
    
    static func isPrime(value : Int) -> Bool{
        var result = true
        if value >= 2 {
            for i in 2..<value {
                if value % i == 0 {
                    result = false
                    break
                }
            }
            return result
        }
        return false
    }
    
    static func createPhrase(numbers: [Int]) -> String{
        var phrase : String = ""
        for num in numbers {
            phrase += " \(num),"
        }
        phrase.removeLast()
        return phrase
    }
    
    static func transformInt(num: String) -> Int {
        let numInt = Int(num)
        return numInt ?? 0
    }
}
