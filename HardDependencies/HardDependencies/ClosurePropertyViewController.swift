//
//  ClosurePropertyViewController.swift
//  HardDependencies
//
//  Created by Lidiomar Fernando dos Santos Machado on 04/08/21.
//

import UIKit

class ClosurePropertyViewController: UIViewController {
    
    var makeAnalytics: () -> Analytics = { Analytics.shared }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        makeAnalytics().track(event: "viewDidAppear - \(type(of: self))")
    }
    
}
