//
//  DataDownloadView.swift
//  RocketApp
//
//  Created by Mariusz Sut on 01/12/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation

protocol DataDownloadViewProtocol {
    func showLoadingView()
    func hideLoadingView()
    func showLoadDataError(_ error: NSError)
}
