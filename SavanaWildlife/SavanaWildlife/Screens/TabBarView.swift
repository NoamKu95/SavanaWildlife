//
//  TabBarView.swift
//  SavanaWildlife
//
//  Created by Noam Kurtzer on 23/02/2023.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
            
            VideosList()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }
            
            Map()
                .tabItem {
                    Image(systemName: "map")
                    Text("Find")
                }
            
            Gallery()
                .tabItem {
                    Image(systemName: "photo")
                    Text("View")
                }
            
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
