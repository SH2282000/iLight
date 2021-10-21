//
//  Light.swift
//  Lights
//
//  Created by Shannah Santucci on 16.10.21.
//

import Foundation
import AVFoundation

class Light {
    var intensity: Float
    var device: AVCaptureDevice?
    var input: AVCaptureDeviceInput?
    
    init(intensity: Float) {
        self.intensity = intensity
        
        if let device = AVCaptureDevice.default(for: .video), let input = try? AVCaptureDeviceInput.init(device: device), device.hasFlash, device.hasTorch {
            self.device = device
            self.input = input
            try? input.device.lockForConfiguration()
            
            do { try input.device.setTorchModeOn(level: intensity) }
            catch { print("erroe") }
            
            input.device.unlockForConfiguration()
        }
    }
    
    func setBrightness(intensity: Float) {
        if let input = input {
            try? input.device.lockForConfiguration()
            do {
                try input.device.setTorchModeOn(level: inBounds(brightness: intensity))
                print(inBounds(brightness: intensity))
            }
            catch { print("error") }
            input.device.unlockForConfiguration()
        }
    }
    
    private func inBounds(brightness: Float) -> Float {
        if brightness > 0.99 {
            return 0.99
        } else if brightness < 0.01 {
            return 0.01
        } else {
            return brightness
        }
    }
}
