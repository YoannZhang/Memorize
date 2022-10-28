//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yoann Zhang on 2022/10/26.
//

import Foundation
import SwiftUI

final class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    private struct GameConstants {
        static let numberOfPairsOfCard = 10
    }
    
    private static let vehicleEmojis = ["🚋", "🚌", "🚎", "🚐", "🚑", "🚒",
                     "🚓", "🚔", "🚕", "🚗", "🚙", "🚚",
                     "🚛", "🚜"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCard: GameConstants.numberOfPairsOfCard) { pairIndex in
            vehicleEmojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    //MARK: - Intent(s)
    func choose(_ card: Card) {
        model.choose(card)
    }
}


