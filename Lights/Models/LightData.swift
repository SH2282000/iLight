//
//  Data.swift
//  Lights
//
//  Created by Shannah Santucci on 23.10.21.
//

import Foundation

struct LightData {
    var intensity: Double
    var isEditing = false
    var isRecording = false
    var isPlaying = false
    var isAuto = false
    var timer: Timer?
    
    var record: [Float] = []

    var height = 300.0
    var light = LightController(intensity: 0.5)
    
    init(intensity: Double) {
        self.intensity = intensity
        self.isEditing = false
        self.isRecording = false
        self.isPlaying = false
        self.isAuto = false
        
        self.record = []

        self.height = 300.0
        self.light = LightController(intensity: Float(intensity))
    }
    
}
