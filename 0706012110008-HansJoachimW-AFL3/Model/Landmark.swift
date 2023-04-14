//
//  Landmark.swift
//  0706012110008-HansJoachimW-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    // get landmark images from resources
    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    // create object var and get values
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    // coordinates object
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}