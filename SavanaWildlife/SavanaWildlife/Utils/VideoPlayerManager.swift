//
//  VideoPlayerManager.swift
//  SavanaWildlife
//
//  Created by Noam Kurtzer on 04/03/2023.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo (fileName: String, fileFormat: String) -> AVPlayer? {
    if let vidUrl = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
        videoPlayer = AVPlayer(url: vidUrl)
        videoPlayer?.play()
    }
    return videoPlayer
}
