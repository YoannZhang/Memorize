//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Yoann Zhang on 2022/9/23.
//

import SwiftUI


struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        ScrollView{
            // Card Stack
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}


struct CardView: View{
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape
                        .fill()
                        .foregroundColor(.white)
                    shape
                        .strokeBorder(lineWidth: DrawingConstants.cardLineWidth)
                    Text(card.content)
                        .font(font(in: geometry.size))
                } else if card.isMatched{
                    shape.opacity(0)
                } else {
                    shape
                        .fill()
                }
            }
        }
    }
    private func font(in size: CGSize) -> Font {
        Font.system(size: DrawingConstants.fontScale * min(size.height,size.width))
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let cardLineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.75
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
    }
}
