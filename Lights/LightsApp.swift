//
//  LightsApp.swift
//  Lights
//
//  Created by Shannah Santucci on 16.10.21.
//

import SwiftUI
import AVFoundation

@main
struct LightsApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView(data: LightData(intensity: 0.5))
        }
    }
}
