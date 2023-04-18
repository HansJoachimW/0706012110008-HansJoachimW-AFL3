//
//  ProfileSummary.swift
//  0706012110008-HansJoachimW-AFL3
//
//  Created by MacBook Pro on 17/04/23.
//

import SwiftUI

struct ProfileSummary: View {
    // add the model data environment object which holds all model values from resource files
    @EnvironmentObject var modelData: ModelData
    
    var profile: Profile

    var body: some View {
        // initialize a scroll view
        ScrollView {
            // embed data in vastack
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)

                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                // add divider
                Divider()

                // embed data in vstack
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)

                    // initialize another scroll view
                    ScrollView(.horizontal) {
                        // embed data in hstack
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                // add divider
                Divider()

                // embed data in vstack
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)

                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

// display
struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
