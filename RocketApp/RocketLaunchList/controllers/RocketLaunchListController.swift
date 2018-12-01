//
//  RocketLaunchListController.swift
//  RocketApp
//
//  Created by Mariusz Sut on 01/12/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import UIKit

class RocketLaunchListController: UITableViewController, RocketLaunchListViewProtocol {
    
    fileprivate var presenter: RocketLaunchListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = RocketLaunchListPresenter(view: self, repository: RocketLaunchListRepository())
        self.presenter?.loadLatestLaunches(page: 0)
        let dataSource = DataSource<RocketLaunch, RocketLaunchListCell>()
        self.tableView.dataSource = dataSource
        self.tableView.delegate = dataSource
    }
    
    func setRocketLauncheList(_ rocketLaunchList: [RocketLaunch]) {
        <#code#>
    }
    
    func showLoadingView() {
        <#code#>
    }
    
    func hideLoadingView() {
        <#code#>
    }
    
    func showLoadDataError(_ error: NSError) {
        <#code#>
    }
}
