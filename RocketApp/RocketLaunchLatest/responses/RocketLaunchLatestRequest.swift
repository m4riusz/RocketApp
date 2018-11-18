//
//  RocketLaunchLatestRequest.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation
import Alamofire

struct RocketLaunchLatestRequest: IBaseRequest {
    var method: HTTPMethod = .get
    var parameters: [String: Any] = [:]
    var headers: [String : String] = [:]
    var url: String
    
    public init(page: Int = 0, pageSize: Int = 10) {
        self.url = "https://launchlibrary.net/1.4/launch?next=\(pageSize)&offset=\(page * pageSize)&mode=verbose"
    }
}
