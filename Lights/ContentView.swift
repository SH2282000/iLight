//
//  ContentView.swift
//  Lights
//
//  Created by Shannah Santucci on 16.10.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Light Controller")
                .padding()
                .font(.title)
                .foregroundColor(.orange)

            CursorView(intensity: 0.5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
