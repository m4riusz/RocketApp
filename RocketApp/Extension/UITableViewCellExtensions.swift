//
//  UITableViewCellExtensions.swift
//  RocketApp
//
//  Created by Mariusz Sut on 01/12/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import UIKit

extension UITableViewCell {
    class func reusableIdentifier()-> String {
        return String(describing: self)
    }
}
