//
//  RocketLaunchLatestResponse.swift
//  RocketApp
//
//  Created by Mariusz Sut on 18/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation

public class RocketLaunchLatestResponse: BasePageResponse {
    let launches: [Launch]
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.launches = try container.decode([Launch].self, forKey: .launches)
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case launches
    }
}
