//
//  SampleClass.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation

import Foundation

public struct RocketLaunch: Codable {
    let launchId: Int
    let status: Int
    let name: String?
    let rocket: Rocket
    let location: Location?
    let windowStart: String?
    
    enum CodingKeys: String, CodingKey {
        case launchId = "id"
        case status
        case name
        case rocket
        case location
        case windowStart = "windowstart"
    }
}

public struct Location: Codable {
    let locationId: Int?
    let name: String?
    let infoUrl: String?
    let wikiUrl: String?
    let countryCode: String?
    
    enum CodingKeys: String, CodingKey {
        case locationId = "id"
        case name
        case infoUrl = "infoURL"
        case wikiUrl = "wikiURL"
        case countryCode
    }
}

public struct Rocket: Codable {
    let rocketID: Int?
    let rocketName: String?
    let rocketType: String?
    let rocketImage: String
    
    enum CodingKeys: String, CodingKey {
        case rocketID = "id"
        case rocketName = "name"
        case rocketType = "familyname"
        case rocketImage = "imageURL"
    }
}
