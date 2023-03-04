//
//  VideosList.swift
//  SavanaWildlife
//
//  Created by Noam Kurtzer on 23/02/2023.
//

import SwiftUI

struct VideosList: View {
    
   @State var videos : [Video] = Bundle.main.decode("videos.json")
    let hapticFeedback = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: VideoPlayerView(videoName: video.id, videoTitle: video.name)) {
                        VideoListItem(video: video)
                            .padding(.vertical, 8)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                        hapticFeedback.impactOccurred()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    }

                }
            }
        }
    }
}

struct VideosList_Previews: PreviewProvider {
    static var previews: some View {
        VideosList()
    }
}
