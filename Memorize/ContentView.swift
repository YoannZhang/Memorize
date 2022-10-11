//
//  ContentView.swift
//  Memorize
//
//  Created by Yoann Zhang on 2022/9/23.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("score:\(viewModel.score)").font(.largeTitle)
            ScrollView{
                // Card Stack
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
                
            }
            .padding(.horizontal)
            .foregroundColor(viewModel.chosenColor)
            Button {
                viewModel.startNewGame()
            } label: {
                Text("Start New Game").font(.largeTitle)
            }
        }
        .padding(.vertical)
        


    }
}



struct CardView: View{
    let card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if card.isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched{
                shape.opacity(0)
            } else {
                shape
                    .fill()
            }
        }
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}
