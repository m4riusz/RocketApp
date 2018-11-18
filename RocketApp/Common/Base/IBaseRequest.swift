//
//  IBaseRequest.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation
import Alamofire

protocol IBaseRequest: NSObjectProtocol {
    var url: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any] { get set }
    var headers: [String: String] { get set }
}
