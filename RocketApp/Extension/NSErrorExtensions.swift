//
//  NSErrorExtensions.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation

extension NSError {
    convenience init(_ reason: String) {
        self.init(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: reason])
    }
}
