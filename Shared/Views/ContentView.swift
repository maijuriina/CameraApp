//
//  ContentView.swift
//  Shared
//
//  Created by Maijuriina Mustonen on 08/03/2021.
//

import SwiftUI

struct ContentView: View {
    @State var showActionSheet:Bool = false
    
    var body: some View {
        VStack {
            Image("cat_photo")
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
        
        }),
        ActionSheet.Button.cancel()
        ])
        })
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
