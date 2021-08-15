//
//  OverrideViewControllerTests.swift
//  HardDependenciesTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 04/08/21.
//

import Foundation
import XCTest
@testable import HardDependencies

class OverrideViewControllerTests: XCTestCase {
    func test_viewDidAppear() {
        let sut = TestableOverrideViewController()
        sut.loadViewIfNeeded()
        
        sut.viewDidAppear(false)
    }
}

private class TestableOverrideViewController: OverrideViewController {
    
    override func analytics() -> Analytics {
        return Analytics()
    }
}
