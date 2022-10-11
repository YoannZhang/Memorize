//
//  MemoryGame.swift
//  Memorize
//
//  Created by Yoann Zhang on 2022/9/30.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    private(set) var score = 0
    
    mutating func choose(_  card: Card) {
        
        // find chosen card via id
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                // check if chosen card and faced up card has same content
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    // true, then isMatched to true
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    // not matched
                    if cards[chosenIndex].isSeen || cards[potentialMatchIndex].isSeen {
                        score -= 1
                    }
                }
                cards[chosenIndex].isSeen = true
                cards[potentialMatchIndex].isSeen = true
                // all card face down
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else { // no card faced up
                for index in cards.indices {
                    // all card faced down
                    cards[index].isFaceUp = false
                }
                // chosen card should be the one need to face up
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp = true
        }
    }
    

    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards * 2 cards to cards array.
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id:pairIndex*2))
            cards.append(Card(content: content, id:pairIndex*2+1))
        }
        
        // cards need to be shuffled
        cards.shuffle()
    }
    
    struct Card:Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var isSeen: Bool = false
        var content: CardContent
        var id: Int
    }
}

struct Theme {
    var name: String
    var emojis: [String]
    var numberOfPairsOfCards: Int
    var color: String
}
