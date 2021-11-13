//
//  MessageFieldView.swift
//  Lights
//
//  Created by Shannah Santucci on 23.10.21.
//

import SwiftUI

struct MessageFieldView: View {
    @Binding var data: MessageData
    var body: some View {
        HStack{
            TextField("Message", text: $data.message).padding()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "arrow.up.circle.fill")
            }
            .padding()
        }
        .font(.title2)
    }
}

struct MessageFieldView_Previews: PreviewProvider {
    static var previews: some View {
        MessageFieldView(data: .constant(MessageData()))
            .overlay(
                Capsule(style: .continuous)
                    .stroke(Color.gray, lineWidth: 2)
            )
        
    }
}
