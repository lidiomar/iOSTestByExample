//
//  CodeBasedViewControllerTests.swift
//  LoadViewControllersTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 04/08/21.
//

import Foundation
import XCTest

@testable import LoadViewControllers

class CodeBasedViewControllerTests: XCTestCase {
    func test_loading() {
        let sut = CodeBasedViewController(data: "DUMMY")
        
        sut.loadViewIfNeeded()
    }
}
