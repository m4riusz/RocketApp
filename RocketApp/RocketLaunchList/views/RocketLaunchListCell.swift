//
//  RocketLaunchListCell.swift
//  RocketApp
//
//  Created by Mariusz Sut on 01/12/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import UIKit
import SnapKit
import FlagKit
import SDWebImage

class RocketLaunchListCell: UITableViewCell {
    fileprivate var rocketLauch: RocketLaunch?
    fileprivate var containerView: UIView?
    fileprivate var countyImageView: UIImageView?
    fileprivate var titleLabel: UILabel?
    fileprivate var rocketImageView: UIImageView?
    fileprivate var startDateLabel: UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    
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
        
        self.containerView?.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: Spacing.default, left: Spacing.default, bottom: Spacing.default, right: Spacing.default))
        }
    }
    
    fileprivate func initCountryImageView() {
        guard self.countyImageView == nil else {
            return
        }
        self.countyImageView = UIImageView()
        self.countyImageView?.translatesAutoresizingMaskIntoConstraints = false
        self.countyImageView?.contentMode = .scaleAspectFit
        self.countyImageView?.setContentHuggingPriority(.required, for: .horizontal)
        self.countyImageView?.setContentHuggingPriority(.required, for: .vertical)
        self.containerView?.addSubview(self.countyImageView!)
        
        self.countyImageView?.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Spacing.none)
            make.right.equalToSuperview().offset(Spacing.none)
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
            make.width.height.equalTo(100)
        }
    }
    
    fileprivate func initTitleLabel() {
        guard self.titleLabel == nil else {
            return
        }
        self.titleLabel = UILabel()
        self.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.numberOfLines = 2
        self.titleLabel?.setContentHuggingPriority(.required, for: .vertical)
        self.containerView?.addSubview(self.titleLabel!)
        
        self.titleLabel?.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Spacing.none)
            make.left.equalTo(self.rocketImageView!.snp.right).offset(Spacing.default)
            make.right.equalTo(self.countyImageView!.snp.left).offset(-Spacing.default)
        }
    }
    
    fileprivate func initStartDateLabel() {
        guard self.startDateLabel == nil else {
            return
        }
        self.startDateLabel = UILabel()
        self.startDateLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.startDateLabel?.numberOfLines = 2
        self.containerView?.addSubview(self.startDateLabel!)
        
        self.startDateLabel?.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel!.snp.bottom).offset(Spacing.default)
            make.left.equalTo(self.rocketImageView!.snp.right).offset(Spacing.default)
            make.right.equalTo(self.countyImageView!.snp.left).offset(-Spacing.default)
            make.bottom.greaterThanOrEqualToSuperview()
        }
    }
}

extension RocketLaunchListCell: UpdatableCell {
    typealias T = RocketLaunch
    
    func updateForViewFor(item: RocketLaunch) {
        self.titleLabel?.text = item.name
        if let url = URL(string: item.rocket.rocketImage) {
            self.rocketImageView?.sd_setImage(with: url)
        }
        if let countryCode = item.location?.countryCode, let countryImage = Flag(countryCode: "PL") {
            self.countyImageView?.image = countryImage.image(style: .roundedRect)
        }
        self.startDateLabel?.text = item.windowStart
    }
}
