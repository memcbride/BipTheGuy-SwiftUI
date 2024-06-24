//
//  ContentView.swift
//  BipTheGuy-SwiftUI
//
//  Created by Mark McBride on 6/24/24.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer!
    @State private var animateImage = true
    
    var body: some View {
        VStack {
            Spacer()
            Image("clown")
                .resizable()
                .scaledToFit()
                .scaleEffect(animateImage ? 1.0 : 0.9)
                .onTapGesture {
                    playSound(soundName: "punchSound")
                    animateImage = false // will immediately shrink using scale effect to 90%
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.3)) {
                        animateImage = true // will go from 90% to 100% size
                    }
                }
            Spacer()
            
            Button(action: {
                //TODO: Button Action Here
            }, label: {
                Label("Photo Library", systemImage: "photo.fill.on.rectangle.fill")
            })
        }
        .padding()
    }
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file named \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print(" Error: \(error.localizedDescription) creating audioPlayer.")
        }
    }
}

#Preview {
    ContentView()
}
