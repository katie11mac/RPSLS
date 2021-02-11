//
//  Sign.swift
//  RPSLS
//
//  Created by Katie Macalintal on 11/12/19.
//  Copyright © 2019 Katie Macalintal. All rights reserved.
//

import Foundation
enum Sign : Int {
    case rock = 1
    case spock = 2
    case paper = 3
    case lizard = 4
    case scissors = 5
    
    var emoji: String {
        switch self{
        case .rock:
            return "👊🏽"
        case .spock:
            return "🖖🏽"
        case .paper:
            return "🤚🏽"
        case .lizard:
            return "🤙🏽"
        case .scissors:
            return "✌🏽"
        }
    }
    
    func beats (_ player: Sign, _ computer: Sign) -> Int {
        
        //let computer = Sign(rawValue: Int.random(in: 1...5))
        let results = (computer.rawValue - player.rawValue + 5) % 5
        
        return results
        /*if results == 1 || results == 2 {
            return "You LOST!"
        } else if results == 3 || results == 4 {
            return "You WON!"
        } else {
            return "It's a TIE!"
        }*/
        
    }
    
}
