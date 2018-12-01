//
//  RocketLaunchListCell.swift
//  RocketApp
//
//  Created by Mariusz Sut on 01/12/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import UIKit
import SnapKit

class RocketLaunchListCell: UITableViewCell {
    fileprivate static let flagSize: CGSize = CGSize(width: 60, height: 30)
    
    fileprivate var rocketLauch: RocketLaunch?
    fileprivate var containerView: UIView?
    fileprivate var countyImageView: UIImageView?
    fileprivate var titleLabel: UILabel?
    fileprivate var rocketImageView: UIImageView?
    fileprivate var startDateLabel: UILabel?
    
    
    fileprivate func initialize() {
        self.initContainerView()
        self.initCountryImageView()
        self.initRocketImageView()
        self.initTitleLabel()
        self.initStartDateLabel()
    }
    
    fileprivate func initContainerView() {
        guard self.containerView == nil else {
            return
        }
        self.containerView = UIView()
        self.containerView?.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.containerView!)
    }
    
    fileprivate func initCountryImageView() {
        guard self.countyImageView == nil else {
            return
        }
        self.countyImageView = UIImageView()
        self.countyImageView?.translatesAutoresizingMaskIntoConstraints = false
        self.containerView?.addSubview(self.countyImageView!)
        
        self.countyImageView?.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Spacing.none)
            make.right.equalToSuperview().offset(Spacing.none)
            make.width.equalToSuperview().dividedBy(10)
        }
    }
    
    fileprivate func initRocketImageView() {
        guard self.rocketImageView == nil else {
            return
        }
        self.rocketImageView = UIImageView()
        self.rocketImageView?.translatesAutoresizingMaskIntoConstraints = false
        self.containerView?.addSubview(self.rocketImageView!)
        
        self.rocketImageView?.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(Spacing.none)
            make.top.equalToSuperview().offset(Spacing.none)
            make.bottom.equalToSuperview().offset(Spacing.none)
            make.width.equalToSuperview().dividedBy(4)
        }
    }
    
    fileprivate func initTitleLabel() {
        guard self.titleLabel == nil else {
            return
        }
        self.titleLabel = UILabel()
        self.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.containerView?.addSubview(self.titleLabel!)
        
        self.titleLabel?.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Spacing.none)
            make.left.equalTo(self.rocketImageView!).offset(Spacing.none)
            make.right.equalTo(self.countyImageView!).offset(Spacing.none)
        }
    }
    
    fileprivate func initStartDateLabel() {
        guard self.startDateLabel == nil else {
            return
        }
        self.startDateLabel = UILabel()
        self.startDateLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.containerView?.addSubview(self.startDateLabel!)
        
        self.startDateLabel?.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel!).offset(Spacing.none)
            make.left.equalTo(self.rocketImageView!).offset(Spacing.none)
            make.right.equalTo(self.countyImageView!).offset(Spacing.none)
            make.bottom.equalToSuperview().offset(Spacing.none)
        }
    }
}

extension RocketLaunchListCell: UpdatableCell {
    typealias T = RocketLaunch
    
    func updateForViewFor(item: RocketLaunch) {
        self.titleLabel?.text = item.name
    }
}
