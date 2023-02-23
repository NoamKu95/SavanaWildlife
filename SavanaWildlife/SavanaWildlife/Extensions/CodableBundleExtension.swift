//
//  CodableBundleExtension.swift
//  SavanaWildlife
//
//  Created by Noam Kurtzer on 23/02/2023.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [CarouselCoverImage] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode([CarouselCoverImage].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return loadedData
    }
}
