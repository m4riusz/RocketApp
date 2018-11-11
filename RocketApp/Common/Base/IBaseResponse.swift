//
//  IBaseResponse.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation
import Alamofire

protocol IBaseResponse: NSObjectProtocol {
    var url: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var httpCode: Int { get }
    var body: Any? { get }
}
