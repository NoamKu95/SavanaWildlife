//
//  MapScreen.swift
//  SavanaWildlife
//
//  Created by Noam Kurtzer on 02/03/2023.
//

import SwiftUI
import MapKit

struct MapScreen: View {
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.00286, longitude: 16.4377599)
        var zoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: zoomLevel)
        
        return mapRegion
    }()
    
    let locations: [AnimalLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: locations) { item in
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }
    }
}

struct MapScreen_Previews: PreviewProvider {
    static var previews: some View {
        MapScreen()
    }
}
