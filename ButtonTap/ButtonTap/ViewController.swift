//
//  ViewController.swift
//  ButtonTap
//
//  Created by Lidiomar Fernando dos Santos Machado on 06/08/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private(set) var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func buttonTap() {
        print(">> Button was tapped")
    }

}

