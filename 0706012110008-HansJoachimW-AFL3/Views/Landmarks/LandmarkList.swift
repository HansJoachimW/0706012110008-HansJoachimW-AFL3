//
//  LandmarkList.swift
//  0706012110008-HansJoachimW-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

// create a list that will contain landmarkrow
struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    // initialize a boolean state
    @State private var showFavoritesOnly = false
    
    // show a filtered list of only favorite landmarks
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
                (!showFavoritesOnly || landmark.isFavorite)
            }
        }
    
    var body: some View {
        // run the list
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                .navigationTitle("Landmarks")
            }
        }
    }
}

// display preview
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        // add sizes of views to different device sizes
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
        LandmarkList()
            .environmentObject(ModelData())
    }
}
