//
//  OutletConnectionsViewControllerTests.swift
//  OutletConnectionsTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 06/08/21.
//

import Foundation
import XCTest
@testable import OutletConnections

class OutletConnectionsViewControllerTests: XCTestCase {
    
    func test_outlets_shouldBeConnected() {
        let sut = OutletConnectionsViewController()
        
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.label, "label")
        XCTAssertNotNil(sut.button, "button")
    }
    
}
