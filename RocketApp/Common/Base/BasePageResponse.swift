//
//  BasePageResponse.swift
//  RocketApp
//
//  Created by Mariusz Sut on 18/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation

public class BasePageResponse: Codable {
    let totalCount: Int
    let offset: Int
    let currentCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case totalCount = "total"
        case offset = "offset"
        case currentCount = "count"
    }
}
