//
//  ContentView.swift
//  TestUI-app
//
//  Created by David Meester on 10/06/2022.
//

import SwiftUI;

// ContentView - main

struct ContentView: View {
    var Emotes = ["🚗","🚕","🏎","🚓","🚡","✈️","🛫","🛬","🛩","🚉","🚅","🚣‍♀️","🎬","🏌️‍♀️","🏊‍♀️","🥇"];
    @State var EmoteCount = 4
    let columns = [GridItem(),GridItem(),GridItem()]
    var body: some View {
        
        VStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(Emotes[0..<EmoteCount],id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit);
                    }
                }
            }
            .padding(.horizontal);
            Spacer()
            HStack {
                MinButton
                Spacer()
                PlusButton
            }
        }
        
    }
    var MinButton: some View {
        Button(action: {
            if EmoteCount > 1 {
                EmoteCount -= 1
            }
            else {
                // give error to user
            }
        }, label: {
            Image(systemName: "minus.circle")
        }).padding(.horizontal).font(.largeTitle)

    }
    var PlusButton: some View {
        Button(action: {
            if EmoteCount < Emotes.count {
                EmoteCount += 1
            }
            else {
                // give error to user
            }
        }, label: {
            Image(systemName: "plus.circle")
        }).padding(.horizontal).font(.largeTitle)
        
    }


}



struct CardView: View {
    var content: String
    @State var IsUp: Bool = false;
    var body: some View {
        ZStack {
            let figure  = RoundedRectangle(cornerRadius: 25)

            if IsUp {
                figure.stroke(lineWidth: 4)
                figure.fill(.white)
            
                Text(content).font(.largeTitle)}
            else {
                figure.fill(.red)
            }
        }.foregroundColor(.blue)
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
