//
//  ProfileEditor.swift
//  0706012110008-HansJoachimW-AFL3
//
//  Created by MacBook Pro on 18/04/23.
//

import SwiftUI

struct ProfileEditor: View {
    // add binding to link data to view
    @Binding var profile: Profile
    
    // add daterange var to load calendar
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        // create list
        List {
            // embed in hstack
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            
            // add toggle button to enable notifs
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications").bold()
            }
            
            // embed in vstack
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                
                // add image picker
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    // show all seasons
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
            // add date picker
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date").bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
