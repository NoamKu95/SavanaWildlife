//
//  SectionIconTitle.swift
//  SavanaWildlife
//
//  Created by Noam Kurtzer on 23/02/2023.
//

import SwiftUI

struct SectionIconTitle: View {
    
    var iconName: String
    var titleText: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(titleText)
                .font(.title3)
                .fontWeight(.bold)
        }
    }
}

struct SectionIconTitle_Previews: PreviewProvider {
    static var previews: some View {
        SectionIconTitle(iconName: "photo.on.rectangle.angled", titleText: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
