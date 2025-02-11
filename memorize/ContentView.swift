//
//  ContentView.swift
//  memorize
//
//  Created by Administrator on 11.02.25.
//

import SwiftUI

//struct ContentView: View { // :VIEW IS LIKE BEHAVE LIKE A VIEW (FOCUS ON BEHAVIOUR)
//    // VAR BODY IS COMPUTED PROP
//    // SOME VIEW ==> THE TYPE OF THIS VAR CAN BE ANY STRUCT IN THE WORLD AS SOON IT BEHAVE LIKE A VIEW ==> RETURN MUST BE A VIEW
//    var body: some View {
//        // can have arguments VStack(alignment: .leading, spacing: 20)
//        // VStack is kinda a function which return a Tuple view
//        // something like VStavk(content: { // list of structs })
//        // view builder who build all these views
//        VStack {
//            Image(systemName: "globe") // CREATING IMAGE STRUCT
//                .imageScale(.large) // ==> these are a view modifiers
//                .foregroundStyle(.tint)
//            Text("Hello, world!") // CREATING TEXT STRUCT
//            
//        }
//        .padding() // adding padding to the whole stack
//        .font(.largeTitle)
//    }
//}

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .imageScale(.small)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false;
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("🐵").font(.largeTitle) // CREATING TEXT STRUCT
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}






#Preview {
    ContentView()
}
