//
//  AnimalLocation.swift
//  SavanaWildlife
//
//  Created by Noam Kurtzer on 04/03/2023.
//

import Foundation
import MapKit

struct AnimalLocation: Codable, Identifiable {
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
