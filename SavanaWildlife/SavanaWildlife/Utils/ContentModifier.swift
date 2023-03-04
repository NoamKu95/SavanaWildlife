//
//  ContentModifier.swift
//  SavanaWildlife
//
//  Created by Noam Kurtzer on 05/03/2023.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
        
    }
}

