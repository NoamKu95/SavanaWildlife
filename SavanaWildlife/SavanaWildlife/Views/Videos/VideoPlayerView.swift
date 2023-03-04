//
//  VideoPlayerView.swift
//  SavanaWildlife
//
//  Created by Noam Kurtzer on 04/03/2023.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    var videoName: String
    var videoTitle: String
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoName, fileFormat: "mp4")) {
                Text("SavanaWildlife App")
                    .opacity(0.3)
            }
            .overlay(
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .padding(.top, 8)
                .padding(.horizontal, 8)
            , alignment: .topLeading
            )
        }
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoName: "lion", videoTitle: "lion")
        }
    }
}
