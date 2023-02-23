//
//  CarouselImage.swift
//  SavanaWildlife
//
//  Created by Noam Kurtzer on 23/02/2023.
//

import SwiftUI

struct CarouselImage: View {
    
    var imageName: String
    
    var body: some View {
        TabView {
            ForEach(0 ..< 5) { item in
                Image(imageName)
                    .resizable()
                    .scaledToFit()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CarouselImage_Previews: PreviewProvider {
    static var previews: some View {
        CarouselImage(imageName: "cover-lion")
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
