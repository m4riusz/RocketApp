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
        worker.execute(request) { (result: BaseResult<[Launch]>) in
            switch result {
            case .success(let items):
                gateway(.success(items))
            case .failure(let error):
                gateway(.failure(error))
            }
        }
    }
}
