//
//  RocketLaunchLatestContract.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation

protocol IRocketLaunchRepository {
     func loadLatestLaunches(page: Int, pageSize: Int, gateway: @escaping RocketLaunchRepositoryLatestGateway)
}

public typealias RocketLaunchRepositoryLatestGateway = BaseGateway<[Launch]>
