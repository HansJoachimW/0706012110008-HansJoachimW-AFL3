//
//  ContentView.swift
//  0706012110008-HansJoachimW-AFL3
//
//  Created by MacBook Pro on 11/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                VStack(alignment: .leading) {
                    Text("Hello, Hans!")
                        .font(.title)
                    HStack {
                        Text("Nice to meet you!")
                            .font(.subheadline)
                        Spacer()
                        Text("º")
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text("About Turtle Rock")
                        .font(.title2)
                    Text("Descriptive text goes here.")
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
