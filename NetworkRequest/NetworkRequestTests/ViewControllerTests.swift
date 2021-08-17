//
//  ViewControllerTests.swift
//  NetworkRequestTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 15/08/21.
//

import Foundation
import XCTest
import ViewControllerPresentationSpy
@testable import NetworkRequest

class ViewControllerTests: XCTestCase {
    
    private var sut: ViewController!
    private var spyURLSession: SpyURLSession!
    private var alertVerifier: AlertVerifier!
    
    override func setUp() {
        super.setUp()
        alertVerifier = AlertVerifier()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        spyURLSession = SpyURLSession()
        sut.session = spyURLSession
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        spyURLSession = nil
        alertVerifier = nil
        super.tearDown()
    }
    
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
    
    
    func test_searchForBookNetworkCall_withSuccessResponse_shouldSaveDataInResults() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut: ViewController = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        let spyURLSession = SpyURLSession()
        let handleResultsCalled = expectation(description: "handleResults called")
        sut.handleResults = { _ in
            handleResultsCalled.fulfill()
        }
        sut.session = spyURLSession
        sut.loadViewIfNeeded()
        
        tap(sut.button)
        
        spyURLSession.dataTaskArgsCompletionHandler.first?( jsonData(), response(statusCode: 200), nil)
        waitForExpectations(timeout: 0.1)
        XCTAssertEqual(sut.results, [SearchResult(artistName: "Artist", trackName: "Track", averageUserRating: 2.5, genres: ["Foo", "Bar"])])
    }
    
    func test_searchForBookNetworkCall_withSuccessResponse_shouldNotSaveDataInResults() {
        tap(sut.button)
        
        spyURLSession.dataTaskArgsCompletionHandler.first?( jsonData(), response(statusCode: 200), nil)
        XCTAssertEqual(sut.results, [])
    }
    
    private func response(statusCode: Int) -> HTTPURLResponse? {
        HTTPURLResponse(url: URL(string: "http://DUMMY")!,
                        statusCode: statusCode,
                        httpVersion: nil,
                        headerFields: nil)
    }
    
    private func jsonData() -> Data {
        """
        {
            "results": [
                {
                    "artistName": "Artist",
                    "trackName": "Track",
                    "averageUserRating": 2.5,
                    "genres": [
                        "Foo",
                        "Bar"
                    ]
                }
            ]
        }
        """.data(using: .utf8)!
    }
    
    private func verifyErrorAlert(message: String, file: StaticString = #file, line: UInt = #line) {
        alertVerifier.verify(
            title: "Network problem",
            message: message,
            animated: true,
            actions: [.default("OK")],
            presentingViewController: sut,
            file: file,
            line: line
        )
        XCTAssertEqual(alertVerifier.preferredAction?.title, "OK", "preferred action", file: file, line: line)
    }

    func test_searchForBookNetworkCall_withError_shouldShowAlert() {
        
        tap(sut.button)
        let alertShown = expectation(description: "alert shown")
        alertVerifier.testCompletion = {
            alertShown.fulfill()
        }
        
        spyURLSession.dataTaskArgsCompletionHandler.first?( nil, nil, TestError(message: "oh no"))
        
        waitForExpectations(timeout: 0.01)
        verifyErrorAlert(message: "oh no")
    }
    
    func test_searchForBookNetworkCall_withErrorPreAsync_shouldNotShowAlert() {
        tap(sut.button)
        
        spyURLSession.dataTaskArgsCompletionHandler.first?( nil, nil, TestError(message: "DUMMY"))
        
        XCTAssertEqual(alertVerifier.presentedCount, 0)
    }

}
