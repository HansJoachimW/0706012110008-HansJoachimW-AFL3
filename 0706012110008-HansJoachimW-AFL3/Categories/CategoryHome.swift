//
//  CategoryHome.swift
//  0706012110008-HansJoachimW-AFL3
//
//  Created by MacBook Pro on 17/04/23.
//

import SwiftUI

struct CategoryHome: View {
    // add environment object
    @EnvironmentObject var modelData: ModelData
    
    // add new state var
    @State private var showingProfile = false
    
    var body: some View {
        // set navigation view
        NavigationView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    // extend content to edges
                    .listRowInsets(EdgeInsets())

                
                // display the dictionary in the loaded categories data as a list
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    // display each landmark
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                // extend content to edges
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            // add title in navigation
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

// display
struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            // "attach" the environment object to the display to show loaded data
            .environmentObject(ModelData())
    }
}
