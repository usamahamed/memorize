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
    let emojs: Array<String> = ["👻", "🐙", "🦐", "🦖", "👻", "🐙", "🦐", "🦖", "👻", "🐙", "🦐", "🦖", "👻", "🐙", "🦐", "🦖"]
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjuster
            
        }
        .foregroundColor(.orange)
        .imageScale(.small)
        .padding()
        
    }
    var cardCountAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojs[index])
                    .aspectRatio(CGSize(width: 2, height: 3), contentMode: .fill)

            }
            
        }
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojs.count)
    }
    
    var cardRemover: some View {
         cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
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
            Group {
                base
                    .fill(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle) // CREATING TEXT STRUCT
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle() // Cannot assign to property: 'self' is immutable you have to use @State
            
        }
    }
}






#Preview {
    ContentView()
}
