//
//  ContentView.swift
//  Memorize
//
//  Created by Yoann Zhang on 2022/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding(.horizontal)
        .foregroundColor(.red)

//        return RoundedRectangle(cornerRadius: 20.0)
//            .stroke(lineWidth: 3)
//            .padding(.horizontal)
//            .foregroundColor(.red)
//        Text("Hello, CS193p!")
//            .foregroundColor(.orange)
//            .padding(.all)
    }
}

struct CardView: View{
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .stroke(lineWidth: 3)
                Text("✈️")
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
