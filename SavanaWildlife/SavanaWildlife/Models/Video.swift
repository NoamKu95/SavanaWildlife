//
//  Video.swift
//  SavanaWildlife
//
//  Created by Noam Kurtzer on 04/03/2023.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    var thumbnail: String {
        "video-\(id)"
    }
}
