//
//  Profile.swift
//  0706012110008-HansJoachimW-AFL3
//
//  Created by MacBook Pro on 17/04/23.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()

    // set username
    static let `default` = Profile(username: "g_kumar")

    // add season enumeratiton
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        var id: String { rawValue }
    }
}
