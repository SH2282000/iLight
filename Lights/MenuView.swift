//
//  MenuView.swift
//  Lights
//
//  Created by Shannah Santucci on 23.10.21.
//

import SwiftUI

struct MenuView: View {
    @Binding var data: LightData
    var body: some View {
        VStack {
            //playing (the record)
            Button(action: {
                data.isPlaying.toggle()
                data.isRecording = false
                data.isAuto = false

                if let timer = data.timer {
                    timer.invalidate()
                }
                var i = 0
                if data.isPlaying {
                    data.timer = Timer.scheduledTimer(withTimeInterval: 1/30, repeats: true) { timer in
                        i += 1
                        if i < data.record.count {
                            data.intensity = Double(data.record[i])
                            data.light.setBrightness(intensity: data.record[i])
                        } else {
                            i = 0
                        }
                    }
                }
            }) {
                Label("Play", systemImage: data.isPlaying ? "play.circle.fill" : "play.circle")
                    .foregroundColor(.orange)
            }.padding()
            
            //recording
            Button(action: {
                data.isRecording.toggle()
                data.isPlaying = false
                data.isAuto = false
                if let timer = data.timer {
                    timer.invalidate()
                }
            }) {
                Label("Record", systemImage: data.isRecording ? "record.circle.fill" : "record.circle")
                    .foregroundColor(.yellow)
            }.padding()
            
            //automatic (sinus)
            Button(action: {
                data.isAuto.toggle()
                data.isRecording = false
                data.isPlaying = false
                
                if let timer = data.timer {
                    timer.invalidate()
                }
                var i = 0.0
                if data.isAuto {
                    data.timer = Timer.scheduledTimer(withTimeInterval: 1/30, repeats: true) { timer in
                        i += 0.1
                        data.intensity = cos(i)/2 + 0.5
                        data.light.setBrightness(intensity: Float(data.intensity))
                    }
                }
            }) {
                Label("Automatic", systemImage: data.isAuto ? "lightbulb.circle.fill" : "lightbulb.circle")
                    .foregroundColor(.yellow)
            }.padding()
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(data: .constant(LightData(intensity: 0.5)))
    }
}
