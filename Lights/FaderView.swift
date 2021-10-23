//
//  FaderView.swift
//  Lights
//
//  Created by Shannah Santucci on 16.10.21.
//

import SwiftUI

struct FaderView: View {
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

struct FaderView_Previews: PreviewProvider {
    static var previews: some View {
        FaderView(data: LightData(intensity: 0.5))
    }
}
