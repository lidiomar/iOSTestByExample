//
//  ViewControllerTests.swift
//  UserDefaultsTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 12/08/21.
//

import Foundation
import XCTest
@testable import UserDefaults

class ViewControllerTests: XCTestCase {
    
    private var sut: ViewController!
    private var defaults: FakeUserDefaults!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: String(describing: ViewController.self)) as? ViewController
        defaults = FakeUserDefaults()
        sut.userDefaults = defaults
    }
    
    func test_viewDidLoad_withEmptyUserDefaults_shoulShow0InCounterLabel() {
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.counterLabel.text, "0")
    }
    
    func test_viewDidLoad_with7InUserDefaults_shouldShow7InCounterLabel() {
        defaults.integers = ["count": 7]
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.counterLabel.text, "7")
    }
    
    func test_tappingButton_with12InUserDefaults_shouldWrite13ToUserDefaults() {
        defaults.integers = ["count": 12]
        sut.loadViewIfNeeded()
        
        tap(sut.incrementButton)
        
        XCTAssertEqual(defaults.integers["count"], 13)
    }
    
    func test_tappingButton_with42InUserDefaults_shouldShow43InCounterLabel() {
        defaults.integers = ["count": 42]
        sut.loadViewIfNeeded()
        
        tap(sut.incrementButton)
        
        XCTAssertEqual(sut.counterLabel.text, "43")
    }
    
    override func tearDown() {
        sut = nil
        defaults = nil
        super.tearDown()
    }
    
}
