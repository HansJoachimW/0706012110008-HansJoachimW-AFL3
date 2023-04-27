//
//  ProfileHost.swift
//  0706012110008-HansJoachimW-AFL3
//
//  Created by MacBook Pro on 17/04/23.
//

import SwiftUI

struct ProfileHost: View {
    // add environment property from .editmode key
    @Environment(\.editMode) var editMode
    // add the modeldata environment variable
    @EnvironmentObject var modelData: ModelData
    // initialize a new state variable with a default username
    @State private var draftProfile = Profile.default

    var body: some View {
        // embed data in vstack
        VStack(alignment: .leading, spacing: 20) {
            // embed in hstack
            HStack {
                // add if statement to add a cancel button in edit mode
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                // add spacer
                Spacer()
                // add an editbutton
                EditButton()
            }
            
            // create if statement to see if edit button is active
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    // add onAppear and onDisappear to make sure data is saved when the user clicks the done button
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }

            ProfileSummary(profile: modelData.profile)
        }
        .padding()
    }
}

// display
struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(ModelData())
    }
}
