//
//  ContentView.swift
//  Lights
//
//  Created by Shannah Santucci on 16.10.21.
//

import SwiftUI

struct ContentView: View {
    @State var data: LightData
    var body: some View {
        VStack {
            Text("Light Controller")
                .padding()
                .font(.title)
                .foregroundColor(.orange)

            CursorView(data: $data)
            MenuView(data: $data)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(data: LightData(intensity: 0.5))
    }
}
