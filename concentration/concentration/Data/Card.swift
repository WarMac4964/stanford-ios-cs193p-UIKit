//
//  Card.swift
//  concentration
//
//  Created by Anurag Tyagi on 18/12/24.
//

import Foundation

struct Card{
    
    var identifier: Int
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
