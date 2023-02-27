//
//  FactsCarouselView.swift
//  SavanaWildlife
//
//  Created by Noam Kurtzer on 24/02/2023.
//

import SwiftUI

struct FactsCarouselView: View {
    
    let animal: Animal
    
    var body: some View {
        GroupBox {
            TabView {
                
                ForEach(animal.facts, id: \.self) { item in
                    Text(item)
                        .font(.body)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

struct FactsCarouselView_Previews: PreviewProvider {
    
    static let animalsList: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        FactsCarouselView(animal: animalsList[4])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
