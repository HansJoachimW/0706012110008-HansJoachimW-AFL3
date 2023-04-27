//
//  _706012110008_HansJoachimW_AFL3App.swift
//  0706012110008-HansJoachimW-AFL3
//
//  Created by MacBook Pro on 11/04/23.
//

import SwiftUI

@main
struct _706012110008_HansJoachimW_AFL3App: App {
    @StateObject private var modelData = ModelData()

       var body: some Scene {
           WindowGroup {
               ContentView()
                   .environmentObject(modelData)
           }
           .commands {
               LandmarkCommands()
           }
           
           Settings {
               LandmarkSettings()
           }
       }
}
