//
//  RocketLaunchRepository.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation

class RocketLaunchRepository: NSObject, IRocketLaunchRepository {
    
    func loadLatestLaunches(page: Int, pageSize: Int, gateway: @escaping RocketLaunchRepositoryLatestGateway) {
        let request = RocketLaunchLatestRequest(page: page, pageSize: pageSize)
        let worker: IRequestExecutor = RequestExecutor()
        worker.execute(request) { (result: BaseResult<RocketLaunchLatestResponse>) in
            switch result {
            case .success(let response):
                gateway(.success(response))
            case .failure(let error):
                gateway(.failure(error))
            }
        }
    }
}
