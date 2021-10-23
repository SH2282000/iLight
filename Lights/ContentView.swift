//
//  TabView.swift
//  Lights
//
//  Created by Shannah Santucci on 23.10.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FaderView(data: LightData(intensity: 0.5))
                .tabItem {
                    Image(systemName: "face.smiling.fill")
                    Text("Fade")
                }.tag(1)
            
            MessageView(data: MessageData())
                .tabItem {
                    Image(systemName: "wave.3.right.circle.fill")
                    Text("Send")
                }.tag(2)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.circle.fill")
                    Text("Set")
                }.tag(3)
        }.font(.headline)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
