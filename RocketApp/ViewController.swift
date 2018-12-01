//
//  ViewController.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let repo: RocketLaunchListRepositoryProtocol = RocketLaunchListRepository()
        repo.loadLatestLaunches(page: 0, pageSize: 10) { (result) in
            switch result {
            case .success(let data):
                print("SUCCESS\n\(data.currentCount)")
            case .failure(let error):
                print("error")
            }
        }
    }


}

