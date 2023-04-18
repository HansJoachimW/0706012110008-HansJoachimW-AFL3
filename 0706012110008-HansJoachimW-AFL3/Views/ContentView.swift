//
//  ContentView.swift
//  0706012110008-HansJoachimW-AFL3
//
//  Created by MacBook Pro on 11/04/23.
//

import SwiftUI

struct ContentView: View {
    // initialize new state
    @State private var selection: Tab = .featured
    
    // add tab enumeration
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        // create a tabview
        TabView(selection: $selection) {
            // display category home
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)

            // display landmarks list
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}   
// display preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
