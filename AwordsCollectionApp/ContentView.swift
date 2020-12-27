//
//  ContentView.swift
//  AwordsCollectionApp
//
//  Created by Alexey Efimov on 05.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showShape = false
    
    var body: some View {
        VStack {
            Button(action: { withAnimation { showShape.toggle() }})
            {
                HStack {
                    Text(showShape ? "Hide Shape" : "Show Shape")
                    Spacer()
                    Image(systemName: "chevron.up.square")
                }
            }
            Spacer()
            
            BallView(width: 200, height: 200)
                .offset(y: showShape ? 0 : -80)
                .animation(.animeBall)
            Spacer()
        }
        .font(.headline)
        .padding()
    }
}

extension Animation {
    static var animeBall: Animation {
        let stiffness = 350.0
        let damping = 5.0
        let initialVelocity = 10.0
        return .interpolatingSpring(stiffness: stiffness, damping: damping, initialVelocity: initialVelocity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
