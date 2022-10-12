//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yoann Zhang on 2022/9/30.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    static private let vehicleEmojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎","🚓", "🚑",
                                "🚒", "🚐", "🛻", "🚚", "🚛", "🚜"]
    static private let ballEmojis = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉",
                             "🎱", "🪀", "🏓"]
    static private let animalEmojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼",
                               "🐻‍❄️", "🐨"]
    static private let moonEmojis = ["🌖", "🌗", "🌘", "🌑", "🌒", "🌓", "🌔", "🌙"]
    static private let buildingEmojis = ["🏢", "🏬", "🏣", "🏤", "🏥", "🏦", "🏨", "🏪",
                                 "🏫", "🏩", "💒"]
    static private let photoEmojis = ["🗾", "🎑", "🏞", "🌅", "🌄", "🌠", "🎇", "🎆",
                              "🌇", "🌆", "🏙", "🌃", "🌌", "🌉", "🌁"]
    
    static private let colors = ["black", "gray", "red", "green", "blue", "orange"]
    
    static private func getColor(_ colorName: String) -> Color {
        switch colorName{
        case "black":
            return .black
        case "gray":
            return .gray
        case "red":
            return .red
        case "green":
            return .green
        case "blue":
            return .blue
        case "orange":
            return .orange
        default:
            return .red
        }
    }
    
    static func createTheme(name:String, emojis:[String], defaultPairsOfCards: Int) -> Theme {
        let color = colors.randomElement()!
        var numberOfPairsOfCards = defaultPairsOfCards
        
        // if Pairs of Cards is beyond emoji list’s capacity, it should be reduced to maximum capacity
        if emojis.count < defaultPairsOfCards {
            numberOfPairsOfCards = emojis.count
        }
        
        return Theme(name: name, emojis: emojis.shuffled(), numberOfPairsOfCards: numberOfPairsOfCards, color: color)
        
    }
    
    static var themes:[Theme] {
        var themes = [Theme]()
        let defaultPairsOfCards = 6
        themes.append(createTheme(name: "vehicle", emojis: vehicleEmojis, defaultPairsOfCards: defaultPairsOfCards))
        themes.append(createTheme(name: "ball", emojis: ballEmojis, defaultPairsOfCards: defaultPairsOfCards))
        themes.append(createTheme(name: "animal", emojis: animalEmojis, defaultPairsOfCards: defaultPairsOfCards))
        themes.append(createTheme(name: "moon", emojis: moonEmojis, defaultPairsOfCards: defaultPairsOfCards))
        themes.append(createTheme(name: "building", emojis: buildingEmojis, defaultPairsOfCards: defaultPairsOfCards))
        themes.append(createTheme(name: "photo", emojis: photoEmojis, defaultPairsOfCards: defaultPairsOfCards))
        return themes
    }
    
    static func createMemorygame(ofTheme chosenTheme: Theme) -> MemoryGame<String> {
        var numberOfPairsOfCards = chosenTheme.numberOfPairsOfCards
        
        // create random pairs of cards for vehicle and ball theme
        if chosenTheme.name == "vehicle" || chosenTheme.name == "ball" {
            numberOfPairsOfCards = Int.random(in: 4...chosenTheme.emojis.count)
        }
        return MemoryGame(numberOfPairsOfCards: numberOfPairsOfCards) { chosenTheme.emojis[$0] }
    }
    
    private(set) var chosenTheme: Theme
    private(set) var chosenColor: Color
    @Published private var model: MemoryGame<String>
    
    static func choseTheme() -> Theme {
        EmojiMemoryGame.themes.randomElement()!
    }
    
    init() {
        chosenTheme = EmojiMemoryGame.choseTheme()
        chosenColor = EmojiMemoryGame.getColor(chosenTheme.color)
        model = EmojiMemoryGame.createMemorygame(ofTheme: chosenTheme)
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    var score: Int {
        model.score
    }
    
    // MARK: - Intent(s)
    
    func choose (_ card: MemoryGame<String>.Card) {
//        objectWillChange.send()
        model.choose(card)
    }
    
    func startNewGame () {
        chosenTheme = EmojiMemoryGame.choseTheme()
        chosenColor = EmojiMemoryGame.getColor(chosenTheme.color)
        model = EmojiMemoryGame.createMemorygame(ofTheme: chosenTheme)
    }
}
