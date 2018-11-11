//
//  BaseGateway.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation

public typealias BaseGateway<T: Codable> = (_ result: BaseResult<T>) -> Void
