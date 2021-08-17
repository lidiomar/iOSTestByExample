//
//  SpyURLSession.swift
//  NetworkRequestTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 16/08/21.
//

import Foundation
@testable import NetworkRequest

private class DummyURLSessionDataTaskS: URLSessionDataTask {
    override func resume() {}
}

class SpyURLSession: URLSessionProtocol {
    
    var dataTaskCallCount = 0
    var dataTaskArgsRequest: [URLRequest] = []
    var dataTaskArgsCompletionHandler: [(Data?, URLResponse?, Error?) -> Void] = []
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        dataTaskCallCount += 1
        dataTaskArgsRequest.append(request)
        dataTaskArgsCompletionHandler.append(completionHandler)
        return DummyURLSessionDataTask()
    }
    
    
}
