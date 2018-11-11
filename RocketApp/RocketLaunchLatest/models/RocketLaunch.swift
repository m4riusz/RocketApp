//
//  SampleClass.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation

import Foundation

public struct Launch: Codable {
    let flightNumber: Int
    let missionName: String
    let launchYear: String
    let launchDateUnix: Int
    let rocket: Rocket
    let launchSite: LaunchSite
    let launchSuccess: Bool
    let staticFireDateUnix: Int
    
    enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case missionName = "mission_name"
        case launchYear = "launch_year"
        case launchDateUnix = "launch_date_unix"
        case rocket
        case launchSite = "launch_site"
        case launchSuccess = "launch_success"
        case staticFireDateUnix = "static_fire_date_unix"
    }
}

public struct LaunchSite: Codable {
    let siteID: String?
    let siteName: String?
    let siteNameLong: String?
    
    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case siteName = "site_name"
        case siteNameLong = "site_name_long"
    }
}

public struct Rocket: Codable {
    let rocketID: String?
    let rocketName: String?
    let rocketType: String?
    
    enum CodingKeys: String, CodingKey {
        case rocketID = "rocket_id"
        case rocketName = "rocket_name"
        case rocketType = "rocket_type"
    }
}
