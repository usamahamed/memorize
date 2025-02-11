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
    let emojs: Array<String> = ["👻", "🐙", "🦐", "🦖"]
    
    var body: some View {
        HStack {
            ForEach(emojs.indices, id: \.self) { index in
                CardView(content: emojs[index])

            }
        }
        .foregroundColor(.orange)
        .imageScale(.small)
        .padding()
    }
}

struct CardView: View {
    // parameters
    let content: String
    @State var isFaceUp = true;
    
    var body: some View {
        ZStack(alignment: .center) {
            // we always use let since we can't reassign things inside the view builder
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base
                    .fill(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle) // CREATING TEXT STRUCT
            } else {
                base.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle() // Cannot assign to property: 'self' is immutable you have to use @State
            
        }
    }
}






#Preview {
    ContentView()
}
