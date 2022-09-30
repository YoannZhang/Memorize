//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yoann Zhang on 2022/9/30.
//

import SwiftUI



class EmojiMemoryGame {
    static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎",
                         "🚓", "🚑", "🚒", "🚐", "🛻", "🚚",
                         "🚛", "🚜"]
    static func createMemorygame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
        
    }
    
    private var model: MemoryGame<String> = createMemorygame()

    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
}
