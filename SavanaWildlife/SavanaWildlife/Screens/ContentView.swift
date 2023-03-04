//
//  ContentView.swift
//  SavanaWildlife
//
//  Created by Noam Kurtzer on 23/02/2023.
//

import SwiftUI

enum GridLayoutIcon: Int {
    case oneBytwo = 1
    case twoBytwo = 2
    case threeBytwo = 3
    
    init(fromRawValue: Int) {
        self = GridLayoutIcon(rawValue: fromRawValue) ?? .oneBytwo
    }
    
    func getNextIconName() -> String {
        switch self {
        case .oneBytwo:
            return "square.grid.2x2"
        case .twoBytwo:
            return "square.grid.3x2"
        case .threeBytwo:
            return "rectangle.grid.1x2"
        }
    }
}

struct ContentView: View {
    
    let animalsList: [Animal] = Bundle.main.decode("animals.json")
    let heptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumns = 1
    @State private var toolbarIcon: String = GridLayoutIcon.oneBytwo.getNextIconName()
    
    
    func switchGridLayout() {
        gridColumns = gridLayout.count % 3 + 1
        gridLayout = Array(repeating: GridItem(.flexible()), count: gridColumns)
        toolbarIcon = GridLayoutIcon.init(rawValue: gridColumns)?.getNextIconName() ?? GridLayoutIcon.oneBytwo.getNextIconName()
    }
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CarouselImage()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animalsList) { animal in
                            NavigationLink(destination: AnimalDetails(animal: animal)) {
                                AnimalListItem(animal: animal)
                            }
                        }
                        
                        CopyrightView()
                            .modifier(CenterModifier())
                    }
                } else {
                    ScrollView (.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animalsList) { item in
                                NavigationLink(destination: AnimalDetails(animal: item)) {
                                    AnimalGridItemView(animal: item)
                                }
                            }
                        }
                        .padding(10)
                        .animation(.easeIn)
                    }
                }
            }
            .navigationBarTitle("Savanna", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack (spacing: 16) {
                        Button(action: {
                            isGridViewActive = false
                            heptics.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        Button(action: {
                            isGridViewActive = true
                            heptics.impactOccurred()
                            switchGridLayout()
                        }) {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
