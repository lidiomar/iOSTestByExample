//
//  MyClassTests.swift
//  LifecycleTestsTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 29/07/21.
//

import XCTest

@testable import LifecycleTests

class MyClassTests: XCTestCase {
    
    private let sut = MyClass()
    
    func test_methodOne() {
        sut.methodOne()
    }
    
    func test_methodTwo() {
        sut.methodTwo()
    }
}
