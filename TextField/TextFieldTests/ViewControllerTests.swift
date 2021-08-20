//
//  ViewControllerTests.swift
//  TextFieldTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 17/08/21.
//

import Foundation
import XCTest
@testable import TextField

class ViewControllerTests: XCTestCase {
    
    private var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        executeRunLoop()
        sut = nil
        super.tearDown()
    }
    
    func test_outlets_shouldBeConnected() {
        XCTAssertNotNil(sut.usernameField, "usernameField")
        XCTAssertNotNil(sut.passwordField, "passwordField")
    }
    
    func test_usernameField_attributesShouldBeSet() {
        let textField = sut.usernameField!
        
        XCTAssertEqual(textField.textContentType, .username)
        XCTAssertEqual(textField.autocorrectionType, .no)
        XCTAssertEqual(textField.returnKeyType, .next)
    }
    
    func test_passwordField_attributesShouldBeSet() {
        let textField = sut.passwordField!
        
        XCTAssertEqual(textField.textContentType, .password)
        XCTAssertEqual(textField.returnKeyType, .go)
        XCTAssertTrue(textField.isSecureTextEntry)
    }
    
    func test_textFieldDelegates_shouldBeConnected() {
        XCTAssertNotNil(sut.usernameField.delegate)
        XCTAssertNotNil(sut.passwordField.delegate)
    }
    
    func test_shouldChangeCharacteres_usernameWithSpaces_shouldPreventChange() {
        let allowChange = shouldChangeCharacteres(sut.usernameField, replacementString: "a b")
        
        XCTAssertEqual(allowChange, false)
    }
    
    func test_shouldChangeCharacteres_usernameWithoutSpaces_shouldNotPreventChange() {
        let allowChange = shouldChangeCharacteres(sut.usernameField, replacementString: "ab")
        
        XCTAssertEqual(allowChange, true)
        
    }
    
    func test_shouldChangeCharacteres_passwordWithSpaces_shouldNotPreventChange() {
        let allowChange = shouldChangeCharacteres(sut.passwordField, replacementString: "a b")
        
        XCTAssertEqual(allowChange, true)
    }
    
    func test_shouldChangeCharacteres_passwordWithoutSpaces_shouldNotPreventChange() {
        let allowChange = shouldChangeCharacteres(sut.passwordField, replacementString: "ab")
        
        XCTAssertEqual(allowChange, true)
    }
    
    func test_shouldReturn_withPassword_shouldPerformLogin() {
        sut.usernameField.text = "USERNAME"
        sut.passwordField.text = "PASSWORD"
        
        shouldReturn(in: sut.passwordField)
    }
    
    func test_shouldReturn_withUserName_shouldMoveInputFocusToPassword() {
        putInViewHierarchy(sut)
        
        shouldReturn(in: sut.usernameField)
        
        XCTAssertTrue(sut.passwordField.isFirstResponder)
    }
    
    func test_shouldReturn_withPassword_shouldDismissKeyboard() {
        putInViewHierarchy(sut)
        sut.passwordField.becomeFirstResponder()
        XCTAssertTrue(sut.passwordField.isFirstResponder)
        
        shouldReturn(in: sut.passwordField)
        
        XCTAssertFalse(sut.passwordField.isFirstResponder)
    }
}
