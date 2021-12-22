//
//  ContentView.swift
//  AttributedStringFeedback
//
//  Created by Ryan Lintott on 2021-12-22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AttributedStringIPAView()
                .tabItem {
                    Image(systemName: "text.bubble")
                    Text("Feedback")
                }
            
            BrokenCharacters()
                .tabItem {
                    Image(systemName: "abc")
                    Text("Broken Characters")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
