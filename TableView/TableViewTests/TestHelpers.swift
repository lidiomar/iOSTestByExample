//
//  TestHelpers.swift
//  TableViewTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 21/08/21.
//

import Foundation
import UIKit

func numberOfRows(tableView: UITableView, section: Int = 0) -> Int? {
    return tableView.dataSource?.tableView(tableView, numberOfRowsInSection: section)
}

func cellForRowAt(tableView: UITableView, row: Int, section: Int = 0) -> UITableViewCell? {
    return tableView.dataSource?.tableView(tableView, cellForRowAt: IndexPath(row: row, section: section))
}

func didSelectRow(tableView: UITableView, row: Int, section: Int = 0) {
    tableView.delegate?.tableView?(tableView, didSelectRowAt: IndexPath(row: row, section: section))
}
