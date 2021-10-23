//
//  Cursor.swift
//  Lights
//
//  Created by Shannah Santucci on 16.10.21.
//

import SwiftUI
import AVFoundation


struct CursorView: View {
    @Binding var data: LightData
    
    var body: some View {
        VStack {
            Text(String(format: "%.0f", data.intensity*100))
                .font(.headline)
                .foregroundColor(data.isEditing ? .orange.opacity(0.7) : .orange)
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
                    .frame(width: 70, height: data.height)
                
                let progression = data.height*data.intensity
                let offset = 150-300*data.intensity/2
                RoundedRectangle(cornerRadius: 50, style: .continuous)
                    .fill(Color.yellow)
                    .frame(width: 70, height: (progression < 70) ? 70 : progression)
                    .offset(y:(offset>115) ? 150*(1-data.intensity) : offset)
                
            }
            .padding()
            .gesture(
                DragGesture()
                    .onChanged({value in
                        if value.location.y >= 0 && value.location.y <= 300 {
                            data.intensity = 1-value.location.y/data.height
                            data.light.setBrightness(intensity: Float(data.intensity))
                            if data.isRecording {
                                print(data.intensity)
                                data.record.append(Float(data.intensity))
                            }
                        }
                        //print(intensity)
                    })
            )
        }
    }
}

struct Cursor_Previews: PreviewProvider {
    
    static var previews: some View {
        CursorView(data: .constant(LightData(intensity: 0.5)))
    }
}
