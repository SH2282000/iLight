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
        MessageFieldView(data: $data)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(data: MessageData())
    }
}
