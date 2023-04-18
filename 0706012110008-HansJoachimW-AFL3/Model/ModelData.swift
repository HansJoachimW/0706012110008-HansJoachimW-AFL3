//
//  ModelData.swift
//  0706012110008-HansJoachimW-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import Foundation
import Combine

// adds an obeservable object
// contains the data from the decoded json resource file
final class ModelData: ObservableObject {
    // load landmarks data
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    // load profile data from default profile values
    @Published var profile = Profile.default
    // load hike data
    var hikes: [Hike] = load("hikeData.json")
    
    //
    var features: [Landmark] {
            landmarks.filter { $0.isFeatured }
        }
    
    // load categories data
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

// error handling
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        // catches path errors
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        // get data from landmarkData.json
        data = try Data(contentsOf: file)
    } catch {
        // catches loading errors
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        // decode the json file
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data) // returns decoded file
    } catch {
        // catches parsing error
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
