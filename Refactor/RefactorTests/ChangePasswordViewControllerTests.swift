//
//  ChangePasswordViewController.swift
//  RefactorTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 28/08/21.
//

import Foundation
import XCTest
@testable import Refactor

class ChangePasswordViewControllerTests: XCTestCase {
    
    private var sut: ChangePasswordViewController!
    private var passwordChanger: MockPasswordChanger!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: ChangePasswordViewController.self))
        passwordChanger = MockPasswordChanger()
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        executeRunLoop()
        sut = nil
        super.tearDown()
    }
    
    func test_outlets_shouldBeConnected() {
        XCTAssertNotNil(sut.cancelBarButton, "cancelBarButton")
        XCTAssertNotNil(sut.confirmPasswordTextField, "confirmPasswordTextField")
        XCTAssertNotNil(sut.oldPasswordTextField, "oldPasswordTextField")
        XCTAssertNotNil(sut.newPasswordTextField, "newPasswordTextField")
        XCTAssertNotNil(sut.submitButton, "submitButton")
        XCTAssertNotNil(sut.navigationBar, "navigationBar")
    }
    
    func test_navigationBar_shouldHaveTitle() {
        XCTAssertEqual(sut.navigationBar.topItem?.title, "Change Password")
    }
    
    func test_cancelBarButton_shouldBeSystemItemCancel() {
        XCTAssertEqual(systemItem(for: sut.cancelBarButton), .cancel)
    }
    
    func test_oldPasswordTextField_shouldHavePlaceholder() {
        XCTAssertEqual(sut.oldPasswordTextField.placeholder, "Current password")
    }
    
    func test_newPasswordTextField_shouldHavePlaceholder() {
        XCTAssertEqual(sut.newPasswordTextField.placeholder, "New password")
    }
    
    func test_confirmPasswordTextField_shouldHavePlaceholder() { XCTAssertEqual(sut.confirmPasswordTextField.placeholder,"Confirm new password")
    }
    
    func test_submitButton_shouldHaveTitle() {
        XCTAssertEqual(sut.submitButton.titleLabel?.text, "Submit")
    }
    
    func test_oldPasswordTextField_shouldHavePasswordAttributes() {
        let textField = sut.oldPasswordTextField!
        XCTAssertEqual(textField.textContentType, .password)
        XCTAssertTrue(textField.isSecureTextEntry)
        XCTAssertTrue(textField.enablesReturnKeyAutomatically)
    }
    
    func test_newPasswordTextField_shouldHavePasswordAttributes() {
        let textField = sut.newPasswordTextField!
        XCTAssertEqual(textField.textContentType, .newPassword)
        XCTAssertTrue(textField.isSecureTextEntry)
        XCTAssertTrue(textField.enablesReturnKeyAutomatically)
    }
    
    func test_confirmPasswordTextField_shouldHavePasswordAttributes() {
        let textField = sut.confirmPasswordTextField!
        XCTAssertEqual(textField.textContentType, .newPassword)
        XCTAssertTrue(textField.isSecureTextEntry)
        XCTAssertTrue(textField.enablesReturnKeyAutomatically)
    }
    
    func test_tappingCancel_withFocusOnOldPassword_shouldResignThatFocus() {
        putFocusOn(textField: sut.oldPasswordTextField)
        XCTAssertTrue(sut.oldPasswordTextField.isFirstResponder)
        
        tap(sut.cancelBarButton)
        
        XCTAssertFalse(sut.oldPasswordTextField.isFirstResponder)
    }
    
    func test_tappingSubmit_withOldPasswordEmpty_shouldNotChangePassword() {
        setUpValidPasswordEntries()
        sut.oldPasswordTextField.text = ""
        
        tap(sut.submitButton)
        
        passwordChanger.verifyChangeNeverCalled()
    }
    
    func test_tappingSubmit_withOldPasswordEmpty_shouldPutFocusOnOldPassword() {
        setUpValidPasswordEntries()
        sut.oldPasswordTextField.text = ""
        putInViewHierarchy(sut)
        
        tap(sut.submitButton)
        
        XCTAssertTrue(sut.oldPasswordTextField.isFirstResponder)
    }
    
    private func putFocusOn(textField: UITextField) {
        putInViewHierarchy(sut)
        textField.becomeFirstResponder()
    }
    
    private func setUpValidPasswordEntries() {
        sut.oldPasswordTextField.text = "NONEMPTY"
        sut.newPasswordTextField.text = "123456"
        sut.confirmPasswordTextField.text = sut.newPasswordTextField.text
    }
}
 
