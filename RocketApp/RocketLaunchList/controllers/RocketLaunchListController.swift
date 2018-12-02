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
    fileprivate var dataSource: DataSource<RocketLaunch, RocketLaunchListCell>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initPullToRefresh()
        self.tableView.register(RocketLaunchListCell.self, forCellReuseIdentifier: RocketLaunchListCell.reusableIdentifier())
        self.presenter = RocketLaunchListPresenter(view: self, repository: RocketLaunchListRepository())
        self.presenter?.loadLatestLaunches(page: 0)
        self.dataSource = DataSource<RocketLaunch, RocketLaunchListCell>()
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
    }
    
    fileprivate func initPullToRefresh() {
        let refreshControl = UIRefreshControl()
        self.tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    func setRocketLauncheList(_ rocketLaunchList: [RocketLaunch]) {
        self.dataSource?.setItems(sections: [Section(title: "", items: rocketLaunchList)])
        self.tableView.reloadData()
    }
    
    func showLoadingView() {
        guard let refreshControl = self.tableView.refreshControl, !refreshControl.isRefreshing else {
            return
        }
        refreshControl.beginRefreshing()
    }
    
    func hideLoadingView() {
        guard let refreshControl = self.tableView.refreshControl, refreshControl.isRefreshing else {
            return
        }
        refreshControl.endRefreshing()
    }
    
    func showLoadDataError(_ error: NSError) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc fileprivate func refreshData() {
        self.presenter?.loadLatestLaunches(page: 0)
    }
}
