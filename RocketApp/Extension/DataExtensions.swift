//
//  DataExtensions.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation

extension Data {
    func toString() -> String {
        return String(data: self, encoding: .utf8)!
    }
}
