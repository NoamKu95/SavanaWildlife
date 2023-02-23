//
//  CarouselImage.swift
//  SavanaWildlife
//
//  Created by Noam Kurtzer on 23/02/2023.
//

import SwiftUI

struct CarouselImage: View {
    
    let carouselImages: [CarouselCoverImage] = Bundle.main.decode("covers.json")
    
    var body: some View {
        TabView {
            ForEach(carouselImages) { item in
                Image(item.imageName)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CarouselImage_Previews: PreviewProvider {
    static var previews: some View {
        CarouselImage()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
