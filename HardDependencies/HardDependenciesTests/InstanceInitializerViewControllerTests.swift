//
//  InstanceInitializerViewControllerTests.swift
//  HardDependenciesTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 04/08/21.
//

import Foundation
import XCTest
@testable import HardDependencies

class InstanceInitializerViewControllerTests: XCTestCase {
    
    func test_viewDidAppear() {
        let sut = InstanceInitializerViewController(analytics: Analytics())
        sut.loadViewIfNeeded()
        
        sut.viewDidAppear(false)
    }
}
