//
//  Gateway.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation

public typealias Gateway<T: Codable> = (_ result: Result<T>) -> Void
