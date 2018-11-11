//
//  BaseResponse.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation
import Alamofire

class BaseResponse: NSObject, IBaseResponse {
    var url: String
    var method: HTTPMethod
    var headers: [String : String]
    var httpCode: Int
    var body: Any?
    
    init(url: String, method: HTTPMethod, headers: [String: String], httpCode: Int, body: Any?) {
        self.url = url
        self.method = method
        self.headers = headers
        self.httpCode = httpCode
        self.body = body
    }
}
