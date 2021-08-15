//
//  StoryboardBaseViewControllerTests.swift
//  LoadViewControllersTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 04/08/21.
//

import Foundation
import XCTest

@testable import LoadViewControllers

class StoryboardBaseViewControllerTests: XCTestCase {
    
    func test_loading() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: StoryboardBasedViewController  = sb.instantiateViewController(identifier: String(describing: StoryboardBasedViewController.self))
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.label)
    }
    
}
