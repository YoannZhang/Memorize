//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Yoann Zhang on 2022/9/23.
//

import SwiftUI

@main //
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
