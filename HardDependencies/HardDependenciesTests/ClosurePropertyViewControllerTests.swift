//
//  ClosurePropertyViewControllerTests.swift
//  HardDependenciesTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 04/08/21.
//

import Foundation
import XCTest
@testable import HardDependencies

class ClosurePropertyViewControllerTests: XCTestCase {
    
    func test_viewDidAppear() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut: ClosurePropertyViewController = storyboard.instantiateViewController(identifier: String(describing: ClosurePropertyViewController.self))
        sut.loadViewIfNeeded()
        sut.makeAnalytics = { Analytics() }
        sut.loadViewIfNeeded()
        sut.viewDidAppear(false)
    }

}
