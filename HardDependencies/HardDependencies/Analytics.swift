//
//  Analytics.swift
//  HardDependencies
//
//  Created by Lidiomar Fernando dos Santos Machado on 04/08/21.
//

import Foundation

class Analytics {
    static let shared = Analytics()
    
    func track(event: String) {
        print(">> " + event)
        
        if self !== Analytics.shared {
            print(">> ...Not the analytics singleton")
        }
    }
}
