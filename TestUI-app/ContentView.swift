//
//  ContentView.swift
//  TestUI-app
//
//  Created by David Meester on 10/06/2022.
//
/*
 TODO
    - 
    - 
 */

import SwiftUI;

// ContentView - main

struct ContentView: View {
    var Emotes = ["🚗","🚕","🏎","🚓","🚡","✈️","🛫","🛬","🛩","🚉","🚅","🚣‍♀️","🎬","🏌️‍♀️","🏊‍♀️","🥇"];
    @State var EmoteCount = 4
    let columns = [GridItem(.adaptive(minimum: 75))]
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(Emotes[0..<EmoteCount],id: \.self) { emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit);
                        }
                    }
                }
                .padding(.horizontal).navigationTitle("Memrize")
            }
        }
    }

}



struct CardView: View {
    var content: String
    @State var IsUp: Bool = false;
    var body: some View {
        ZStack {
            let figure  = RoundedRectangle(cornerRadius: 25)

            if IsUp {
                figure.fill(.white)
                figure.strokeBorder(lineWidth: 4)
                Text(content).font(.largeTitle)}
            else {
                figure.fill(.red)
            }
        }.foregroundColor(.red)
            .onTapGesture {
                IsUp = !IsUp
            }
    }
}
 

// ContentView_Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
        
//        ContentView()
//            .preferredColorScheme(.dark)
//            .previewInterfaceOrientation(.portrait)
    }
}
