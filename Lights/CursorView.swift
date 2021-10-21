//
//  Cursor.swift
//  Lights
//
//  Created by Shannah Santucci on 16.10.21.
//

import SwiftUI
import AVFoundation


struct CursorView: View {
    @State var intensity: Double
    @State private var isEditing = false
    @State private var isRecording = false
    @State private var isPlaying = false
    @State private var isAuto = false
    @State private var timer: Timer?
    
    @State private var record: [Float] = []

    var height = 300.0
    var light = Light(intensity: 0.5)
    
    var body: some View {
        VStack {
            Text(String(format: "%.0f", intensity*100))
                .font(.headline)
                .foregroundColor(isEditing ? .orange.opacity(0.7) : .orange)
            /*Slider(
                value: $intensity,
                in: 0...1,
                onEditingChanged: { editing in
                    isEditing = editing
                }
                
            )*/
            ZStack() {
                RoundedRectangle(cornerRadius: 50, style: .continuous)
                    .fill(Color.yellow.opacity(0.5))
                    .frame(width: 70, height: height)
                
                let progression = height*intensity
                let offset = 150-300*intensity/2
                RoundedRectangle(cornerRadius: 50, style: .continuous)
                    .fill(Color.yellow)
                    .frame(width: 70, height: (progression < 70) ? 70 : progression)
                    .offset(y:(offset>115) ? 150*(1-intensity) : offset)
                
            }
            .padding()
            .gesture(
                DragGesture()
                    .onChanged({value in
                        if value.location.y >= 0 && value.location.y <= 300 {
                            intensity = 1-value.location.y/height
                            light.setBrightness(intensity: Float(intensity))
                            if isRecording {
                                print(intensity)
                                record.append(Float(intensity))
                            }
                        }
                        //print(intensity)
                    })
            )

            //playing (the record)
            Button(action: {
                isPlaying.toggle()
                var i = 0
                if isPlaying {
                    timer = Timer.scheduledTimer(withTimeInterval: 1/30, repeats: true) { timer in
                        i += 1
                        if i < record.count {
                            intensity = Double(record[i])
                            light.setBrightness(intensity: record[i])
                        } else {
                            i = 0
                        }
                    }
                } else {
                    if let timer = timer {
                        timer.invalidate()
                    }
                }
            }) {
                Label("Play", systemImage: isPlaying ? "play.circle.fill" : "play.circle")
                    .foregroundColor(.orange)
            }.padding()
            
            //recording
            Button(action: {
                isRecording.toggle()
            }) {
                Label("Record", systemImage: isRecording ? "record.circle.fill" : "record.circle")
                    .foregroundColor(.yellow)
            }.padding()
            
            //automatic (sinus)
            Button(action: {
                isAuto.toggle()
                var i = 0.0
                if isAuto {
                    timer = Timer.scheduledTimer(withTimeInterval: 1/30, repeats: true) { timer in
                        i += 0.1
                        intensity = cos(i)/2 + 0.5
                        light.setBrightness(intensity: Float(intensity))
                    }
                } else {
                    if let timer = timer {
                        timer.invalidate()
                    }
                }
            }) {
                Label("Automatic", systemImage: isAuto ? "lightbulb.circle.fill" : "lightbulb.circle")
                    .foregroundColor(.yellow)
            }.padding()
        }
    }
}

struct Cursor_Previews: PreviewProvider {
    
    static var previews: some View {
        CursorView(intensity: 0.5)
    }
}
