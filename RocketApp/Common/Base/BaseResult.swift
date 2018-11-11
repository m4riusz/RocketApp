//
//  BaseResult.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation

public enum BaseResult<T: Codable> {
    case success(_ result: T)
    case failure(_ error: NSError)
}
