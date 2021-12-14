//
//  CameraView.swift
//  Lights
//
//  Created by Shannah Santucci on 23.10.21.
//

import SwiftUI
import AVFoundation
import UIKit

struct CameraView: View {
    @State var image: UIImage?
    var body: some View {
        CameraRepresentable(image: self.$image)

    }
}
struct CameraRepresentable: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    func makeUIViewController(context: Context) -> CameraController {
        let controller = CameraController()
        controller.delegate = context.coordinator
        return controller
    }
    func updateUIViewController(_ uiViewController: CameraController, context: Context) {
        
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    class Coordinator: NSObject, UINavigationControllerDelegate, AVCapturePhotoCaptureDelegate {
        let parent: CameraRepresentable
        
        init(_ parent: CameraRepresentable) {
            self.parent = parent
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
