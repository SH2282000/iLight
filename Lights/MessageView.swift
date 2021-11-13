//
//  MessageView.swift
//  Lights
//
//  Created by Shannah Santucci on 23.10.21.
//

import SwiftUI

struct MessageView: View {
    @State var data: MessageData
    var body: some View {
        VStack {
            ZStack {
                //RoundedRectangle(cornerRadius: 20)
                CameraView()
            }
            MessageFieldView(data: $data)
                .overlay(
                    Capsule(style: .continuous)
                        .stroke(Color.gray, lineWidth: 2)
                )
                .padding()
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(data: MessageData())
    }
}
