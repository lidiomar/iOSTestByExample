//
//  ClosureInitializerViewControllerTests.swift
//  HardDependenciesTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 04/08/21.
//

import Foundation
import XCTest
@testable import HardDependencies

class ClosureInitializerViewControllerTests: XCTestCase {
    
    func test_viewDidAppear() {
        let sut = ClosureInitializerViewController { Analytics() }
        sut.loadViewIfNeeded()
        
        sut.viewDidAppear(false)
    }

}
