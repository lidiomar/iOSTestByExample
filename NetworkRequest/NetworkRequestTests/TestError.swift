//
//  TestError.swift
//  NetworkRequestTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 16/08/21.
//

import Foundation

struct TestError: LocalizedError {
    let message: String
    var errorDescription: String? { message }
}
