//
//  RocketLaunchListPresenter.swift
//  RocketApp
//
//  Created by Mariusz Sut on 01/12/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation

class RocketLaunchListPresenter: NSObject, RocketLaunchListPresenterProtocol {
    fileprivate static let pageSize = 10
    
    fileprivate weak var view: RocketLaunchListViewProtocol?
    fileprivate let repository: RocketLaunchListRepositoryProtocol
    
    init(view: RocketLaunchListViewProtocol, repository: RocketLaunchListRepositoryProtocol) {
        self.view = view
        self.repository = repository
    }
    
    func loadLatestLaunches(page: Int) {
        self.view?.showLoadingView()
        self.repository.loadLatestLaunches(page: page, pageSize: RocketLaunchListPresenter.pageSize) {[weak self] (result) in
            switch result {
            case .success(let items):
                self?.view?.hideLoadingView()
                self?.view?.setRocketLauncheList(items.launches)
            case .failure(let error):
                self?.view?.hideLoadingView()
                self?.view?.showLoadDataError(error)
            }
        }
    }
}
