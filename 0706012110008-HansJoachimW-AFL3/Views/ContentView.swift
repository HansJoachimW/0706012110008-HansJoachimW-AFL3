//
//  ContentView.swift
//  0706012110008-HansJoachimW-AFL3
//
//  Created by MacBook Pro on 11/04/23.
//

import SwiftUI

struct ContentView: View {
    // initialize model date
    @StateObject private var modelData = ModelData()
    
    var body: some View {
        VStack {
            LandmarkList()
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
