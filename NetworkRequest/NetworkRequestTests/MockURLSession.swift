//
//  MockURLSession.swift
//  NetworkRequestTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 15/08/21.
//

import Foundation
import XCTest
@testable import NetworkRequest

class MockURLSession: URLSessionProtocol {
    
    var dataTaskCallCount = 0
    var dataTaskArgsRequest: [URLRequest] = []
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        dataTaskCallCount += 1
        dataTaskArgsRequest.append(request)
        return DummyURLSessionDataTask()
    }
    
    func verifyDataTask(with request: URLRequest, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(dataTaskCallCount, 1, "call count", file: file, line: line)
        XCTAssertEqual(dataTaskArgsRequest.first, request, "request", file: file, line: line)
    }

}
