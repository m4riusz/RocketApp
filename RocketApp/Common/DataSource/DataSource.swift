//
//  DataSource.swift
//  RocketApp
//
//  Created by Mariusz Sut on 01/12/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import UIKit

struct Section<T> {
    var title: String
    var items: [T]
}

protocol UpdatableCell {
    associatedtype AssociatedType
    func updateForViewFor(item: AssociatedType)
}

class DataSource<T, Cell: UITableViewCell & UpdatableCell>: NSObject, UITableViewDataSource, UITableViewDelegate where Cell.AssociatedType == T {
    fileprivate var sections: [Section<T>] = []
    
    func setItems(sections: [Section<T>]) {
        self.sections = sections
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.reusableIdentifier()) as? Cell else {
            return Cell()
        }
        cell.updateForViewFor(item: self.sections[indexPath.section].items[indexPath.row])
        return cell
    }
}

