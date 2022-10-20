//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yoann Zhang on 2022/9/30.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎",
                         "🚓", "🚑", "🚒", "🚐", "🛻", "🚚",
                         "🚛", "🚜"]
    private static func createMemorygame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in
            emojis[pairIndex]
        }
        
    }
    
    @Published private var model = createMemorygame()

    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose (_ card: Card) {
//        objectWillChange.send()
        model.choose(card)
    }
}



struct Previews_EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
