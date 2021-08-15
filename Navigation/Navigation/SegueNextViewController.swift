//
//  SegueNextViewController.swift
//  Navigation
//
//  Created by Lidiomar Fernando dos Santos Machado on 09/08/21.
//

import UIKit

class SegueNextViewController: UIViewController {

    var labelText: String?
    
    @IBOutlet private(set) var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText
    }
}
