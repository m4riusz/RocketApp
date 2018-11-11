//
//  IRequestExecutor.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation
import Alamofire

protocol IRequestExecutor: NSObjectProtocol {
    func execute<T: Codable>(_ request: IBaseRequest, gateway: @escaping BaseGateway<T>)
}
