//
//  ViewControllerTests.swift
//  NetworkRequestTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 15/08/21.
//

import Foundation
import XCTest
@testable import NetworkRequest

class ViewControllerTests: XCTestCase {
    
    func test_tappingButton_shouldMakeDataTaskToSearchForEBookOutFromBoneville() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut: ViewController = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        let mockedSession = MockURLSession()
        sut.session = mockedSession
        sut.loadViewIfNeeded()
        
        tap(sut.button)
        
        mockedSession.verifyDataTask(with: URLRequest(url: URL(string: "https://itunes.apple.com/search?" +
                                                                "media=ebook&term=out%20from%20boneville")!))
    }
    
}
