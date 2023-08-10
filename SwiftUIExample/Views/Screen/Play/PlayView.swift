//
//  PlayView.swift
//  SwiftUIExample
//
//  Created by Neosoft on 09/08/23.
//

import SwiftUI

struct PlayView: View {
    
    @State private var currentImage: UIImage = UIImage(systemName: "music.note") ?? UIImage()
    
    @State private var isPlaying: Bool = false
    @State private var playStatus: String = "Not Playing"
    @State var isShowPhotoLibrary: Bool
    
    var body: some View {
        VStack {
            Image(uiImage: currentImage)
                .resizable()
                .frame(width: 300,height: 300,alignment: .topLeading)
                .background(.gray)
                .cornerRadius(16)
            
            HStack {
                Button("Select Photo") {
                    isShowPhotoLibrary.toggle()
                }
                .padding()
                
                .sheet(isPresented: $isShowPhotoLibrary) {
                    ImagePicker(sourcetype: .photoLibrary, selectedImage: $currentImage)
                }
            }
            
            Text(playStatus)
                .font(.subheadline)
                .frame(maxWidth: 350,alignment: .leading)
                .padding(16)
            
            HStack(alignment: .center,spacing: 70) {
                Button {
                    debugPrint("Previous clicked")
                } label: {
                    Image(systemName: "backward")
                        .resizable()
                        .frame(width: 60,height: 60,alignment: .center)
                }

                Button {
                    isPlaying.toggle()
                    playStatus = isPlaying ? "Playing" : "Not Playing"
                } label: {
                    Image(systemName: isPlaying ? "pause" : "play")
                        .resizable()
                        .frame(width: 60,height: 60,alignment: .center)
                }
                
                Button {
                    debugPrint("Next clicked")
                } label: {
                    Image(systemName: "forward")
                        .resizable()
                        .frame(width: 60,height: 60,alignment: .center)
                }
            }
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView(isShowPhotoLibrary: false)
    }
}
