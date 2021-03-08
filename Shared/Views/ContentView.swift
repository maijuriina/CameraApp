//
//  ContentView.swift
//  Shared
//
//  Created by Maijuriina Mustonen on 08/03/2021.
//

import SwiftUI

struct ContentView: View {
    @State var showImagePicker:Bool = false
    @State var showActionSheet:Bool = false
    @State var image: Image?
    
    var body: some View {
        ZStack {
            VStack {
                image?
                    .resizable()
                    .clipped()
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 160, height: 160)
                    .overlay(
                        CameraButtonView(showActionSheet: $showActionSheet)
                            .offset(x: 50, y: 65)
                    )
                Text("Kitty McWhiskers")
                    .fontWeight(.bold)
                    .padding()
            }.offset(y: -70)
            .actionSheet(isPresented: $showActionSheet, content: { () -> ActionSheet in ActionSheet(title: Text("Select Image"), message: Text("Please select an image from the image gallery or use the camera"), buttons: [
                ActionSheet.Button.default(Text("Camera"), action: {
        
                }), ActionSheet.Button.default(Text("Photo Gallery"), action: {
                    self.showImagePicker.toggle()
                }),
                ActionSheet.Button.cancel()
            ])
        })
        if showImagePicker {
            ImagePickerView(isVisible: $showImagePicker, image: $image)
        }
    }
        .onAppear { self.image = Image("cat_photo") }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
