//
//  Landmark.swift
//  0706012110008-HansJoachimW-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import Foundation
import SwiftUI
import CoreLocation

// creates landmark strucg
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    // add category property   
    var category: Category
    // add category enumeration
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    // get landmark images from assets
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    // add featured images
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }

    // create object var and get values
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    // creates coordinates struct
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
