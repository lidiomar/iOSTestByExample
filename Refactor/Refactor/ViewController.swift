//
//  ViewController.swift
//  Refactor
//
//  Created by Lidiomar Fernando dos Santos Machado on 28/08/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changePassword" {
            let changePasswordVC = ChangePasswordViewController()
            changePasswordVC.securityToken = "TOKEN"
        }
    }

}

