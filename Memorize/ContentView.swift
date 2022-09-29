//
//  ContentView.swift
//  Memorize
//
//  Created by Yoann Zhang on 2022/9/23.
//

import SwiftUI
let emojis1 = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎",
              "🚓", "🚑", "🚒", "🚐", "🛻", "🚚",
              "🚛", "🚜"]
let emojis2 = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌",
               "🍉", "🍇", "🍓", "🫐", "🍈", "🍒",
               "🍑", "🥭", "🍍", "🥥", "🥝", "🍅",
               "🍆", "🥑"]
let emojis3 = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾",
               "🏐", "🏉", "🥏", "🎱", "🪀", "🏓",
               "🏸", "🏒", "🏑", "🥍"]

struct ContentView: View {
    
    @State var emojis = emojis1
    
    @State var emojiCount = 4
    var body: some View {
        
        VStack{
            Text("Memorize!").font(.largeTitle).padding(.all)
            ScrollView{
                // Card Stack
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .padding(.horizontal)
            .foregroundColor(.red)
            Spacer()
            HStack {
                theme1
                Spacer(minLength: 15)
                theme2
                Spacer(minLength: 15)
                theme3
            }
            .padding(.horizontal)
            .foregroundColor(.blue)
            
        }
    
    }
    
    
    // Theme change buttons
    var theme1: some View {
        VStack{
            
            Button {
                emojis = emojis1.shuffled()
                emojiCount = Int.random(in: 4...emojis.count)
            } label: {
                Image(systemName: "car").font(.largeTitle)
            }
            Text("Vehicles")
        }
    }
    var theme2: some View {
        VStack{
            
            Button {
                emojis = emojis2.shuffled()
                emojiCount = Int.random(in: 4...emojis.count)
            } label: {
                Image(systemName: "questionmark.square").font(.largeTitle)
            }
            Text("Fruits")
        }
    }
    var theme3: some View {
        VStack{
            
            Button {
                emojis = emojis3.shuffled()
                emojiCount = Int.random(in: 4...emojis.count)
            } label: {
                Image(systemName: "sportscourt").font(.largeTitle)
            }
            Text("Sports")
        }
    }
//    var add: some View {
//        Button {
//            if emojiCount < emojis.count {
//                emojiCount += 1
//            }
//        } label: {
//            Image(systemName: "plus.circle").font(.largeTitle)
//        }
//    }
//
//    var remove: some View {
//        Button{
//            if emojiCount > 1 {
//                emojiCount -= 1
//            }
//        } label: {
//            Image(systemName: "minus.circle").font(.largeTitle)
//        }
//    }
}


struct CardView: View{
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
