//
//  RocketLaunchLatestContract.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation

protocol IRocketLauchListView: NSObjectProtocol, DataDownloadViewProtocol {
    func setRocketLauncheList(_ rocketLaunchList: [RocketLaunch])
}

protocol IRocketLaunchListPresenter: NSObjectProtocol {
    func loadLatestLaunches(page: Int)
}

protocol IRocketLaunchListRepository: NSObjectProtocol {
     func loadLatestLaunches(page: Int, pageSize: Int, gateway: @escaping RocketLaunchListGateway)
}

public typealias RocketLaunchListGateway = Gateway<RocketLaunchListLatestResponse>
