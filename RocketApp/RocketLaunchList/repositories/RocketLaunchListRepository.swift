//
//  RocketLaunchRepository.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation

class RocketLaunchListRepository: NSObject, RocketLaunchListRepositoryProtocol {
    
    func loadLatestLaunches(page: Int, pageSize: Int, gateway: @escaping RocketLaunchListGateway) {
        let request = RocketLaunchListLatestRequest(page: page, pageSize: pageSize)
        request.execute(request) { (result: Result<RocketLaunchListLatestResponse>) in
            switch result {
            case .success(let response):
                gateway(.success(response))
            case .failure(let error):
                gateway(.failure(error))
            }
        }
    }
}
