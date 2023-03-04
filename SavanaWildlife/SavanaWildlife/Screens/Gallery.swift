//
//  Gallery.swift
//  SavanaWildlife
//
//  Created by Noam Kurtzer on 23/02/2023.
//

import SwiftUI

struct Gallery: View {
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    @State private var selectedAnimal: String = "lion"
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var columns: Double = 3.0
    
    let heticFeedback = UIImpactFeedbackGenerator(style: .medium)
    
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(columns))
    }

    
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            
            VStack (alignment: .center, spacing: 30) {
                
                // BIG IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                // SLIDER
                Slider(value: $columns, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: columns, perform: { _ in
                        gridSwitch()
                    })
                
                // GRID
                LazyVGrid (columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.imageName
                                heticFeedback.impactOccurred()
                            }
                    }
                }
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            }
            .padding(.horizontal)
            .padding(.vertical, 15)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct Gallery_Previews: PreviewProvider {
    static var previews: some View {
        Gallery()
    }
}
