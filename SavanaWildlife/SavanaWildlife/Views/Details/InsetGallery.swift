//
//  InsetGallery.swift
//  SavanaWildlife
//
//  Created by Noam Kurtzer on 23/02/2023.
//

import SwiftUI

struct InsetGallery: View {
    
    var animal : Animal
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack (alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }
            }
        }
    }
}

struct InsetGallery_Previews: PreviewProvider {
    
    static let animalsList: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetGallery(animal: animalsList[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
