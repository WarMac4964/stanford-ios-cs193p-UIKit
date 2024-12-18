//
//  Concentration.swift
//  concentration
//
//  Created by Anurag Tyagi on 18/12/24.
//

import Foundation

class Concentration{
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyCardFaceUp: Int?
    
    func chooseCard(at index: Int){
        var choosenCard = cards[index]
        if !choosenCard.isMatched{
            if let matchIndex = indexOfOneAndOnlyCardFaceUp, matchIndex != index{
                // Check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    
                }
                indexOfOneAndOnlyCardFaceUp = nil
                cards[index].isFaceUp = true
            }else{
                // Either no cards or two cards are faced up
                for cardIndex in cards.indices{
                    cards[cardIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyCardFaceUp = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards = cards + [card, card]
        }
    }
}
