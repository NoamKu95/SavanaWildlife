//
//  AnimalGridItemView.swift
//  SavanaWildlife
//
//  Created by Noam Kurtzer on 04/03/2023.
//

import SwiftUI

struct AnimalGridItemView: View {
    
    let animal: Animal
    
    var body: some View {
        Image(animal.imageName)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    
    static var animalsList: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGridItemView(animal: animalsList[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
