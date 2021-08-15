//
//  ViewControllerTests.swift
//  ButtonTapTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 06/08/21.
//

import XCTest
@testable import ButtonTap

class ViewControllerTests: XCTestCase {

    func test_tappingButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut: ViewController = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
        tap(sut.button)
    }
    
}
