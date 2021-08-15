//
//  InstancePropertyViewController.swift
//  HardDependencies
//
//  Created by Lidiomar Fernando dos Santos Machado on 04/08/21.
//

import UIKit

class InstancePropertyViewController: UIViewController {
    
    lazy var analytics = Analytics.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        analytics.track(event: "viewDidAppear - \(type(of: self))")
    }

}
