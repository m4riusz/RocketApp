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
    let launchId: Int
    let status: Int
    let name: String?
    let rocket: Rocket
    let location: Location?
    
    enum CodingKeys: String, CodingKey {
        case launchId = "id"
        case status
        case name
        case rocket
        case location
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
    
    enum CodingKeys: String, CodingKey {
        case rocketID = "id"
        case rocketName = "name"
        case rocketType = "familyname"
    }
}
