//
//  AnimalDetails.swift
//  SavanaWildlife
//
//  Created by Noam Kurtzer on 23/02/2023.
//

import SwiftUI

struct AnimalDetails: View {
    
    let animal: Animal
    
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            VStack (alignment: .center, spacing: 20) {
                
                // Hero image
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                
                // title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                // headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // gallery
                Group  {
                    SectionIconTitle(iconName: "photo.on.rectangle.angled", titleText: "Wilderness in Pictures")
                    InsetGallery(animal: animal)
                }
                .padding(.vertical)
                
                // facts
                Group {
                    SectionIconTitle(iconName: "questionmark.circle", titleText: "Did you know?")
                    FactsCarouselView(animal: animal)
                }
                .padding(.horizontal)
                
                // description
                Group {
                    SectionIconTitle(iconName: "info.circle", titleText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                // map
                Group {
                    SectionIconTitle(iconName: "map", titleText: "National Parks")
                }
                .padding(.horizontal)
                
            }
            .navigationBarTitle("Learn about the \(animal.name)", displayMode: .inline)
        }
    }
}

struct AnimalDetails_Previews: PreviewProvider {
    static let animalsList: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView {
            AnimalDetails(animal: animalsList[0])
        }
        
    }
}
