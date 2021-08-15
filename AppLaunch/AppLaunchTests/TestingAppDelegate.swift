//
//  AppDelegate.swift
//  AppLaunch
//
//  Created by Lidiomar Fernando dos Santos Machado on 03/08/21.
//

import UIKit

@objc(TestingAppDelegate)
class TestingAppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("<< Launching with testing app delegate")
        return true
    }

}

