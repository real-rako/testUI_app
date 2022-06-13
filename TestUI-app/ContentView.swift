//
//  ContentView.swift
//  TestUI-app
//
//  Created by David Meester on 10/06/2022.
//

import SwiftUI

// ContentView - main

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView(IsUp: false)
            CardView()
             CardView(IsUp: false)
        }.padding(.horizontal)
    }
}



struct CardView: View {
    @State var IsUp: Bool = true;
    var body: some View {
        ZStack {
            let figure  = RoundedRectangle(cornerRadius: 25)

            if IsUp {
            figure.stroke(lineWidth: 4)
            figure.fill(.white)
            
                Text("🏎").font(.largeTitle)}
            else {
                figure.fill(.blue)
            }
        }.foregroundColor(.blue)
            .onTapGesture {
                if IsUp {
                    IsUp = false
                } else {IsUp = true}
            }
    }
}
 

// ContentView_Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
        
        ContentView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
    }
}
