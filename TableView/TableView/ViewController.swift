//
//  ViewController.swift
//  TableView
//
//  Created by Lidiomar Fernando dos Santos Machado on 19/08/21.
//

import UIKit

class ViewController: UITableViewController {
    
    private let model = [
        "One",
        "Two",
        "Three"
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(model[indexPath.row])
    }
    
}

