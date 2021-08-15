//
//  FakeUserDefaults.swift
//  UserDefaultsTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 12/08/21.
//

import Foundation

@testable import UserDefaults

class FakeUserDefaults: UserDefaultsProtocol {
    
    var integers: [String: Int] = [:]
    
    func set(_ value: Int, forKey defaultName: String) {
        integers[defaultName] = value
    }
    
    func integer(forKey defaultName: String) -> Int {
        return integers[defaultName] ?? 0
    }
    
}
