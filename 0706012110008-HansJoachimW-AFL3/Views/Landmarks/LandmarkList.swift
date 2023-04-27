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
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: Landmark?
    
    enum FilterCategory: String, CaseIterable, Identifiable {
           case all = "All"
           case lakes = "Lakes"
           case rivers = "Rivers"
           case mountains = "Mountains"

           var id: FilterCategory { self }
    }

    
    // show a filtered list of only favorite landmarks
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
                (!showFavoritesOnly || landmark.isFavorite) && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var title: String {
           let title = filter == .all ? "Landmarks" : filter.rawValue
           return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }
    
    var body: some View {
        // run the list
        NavigationView {
            List(selection: $selectedLandmark) {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
                .navigationTitle(title)
                .frame(minWidth: 300)
                .toolbar {
                    ToolbarItem {
                        Menu {
                            Picker("Category", selection: $filter) {
                                ForEach(FilterCategory.allCases) { category in
                                    Text(category.rawValue).tag(category)
                                }
                            }
                            .pickerStyle(.inline)
                            
                            Toggle(isOn: $showFavoritesOnly) {
                                Label("Favorites only", systemImage: "star.fill")
                            }
                        } label: {
                            Label("Filter", systemImage: "slider.horizontal.3")
                        }
                    }
                }
                
                Text("Select a Landmark")
            }
            .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
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
