//
//  CoveredClass.swift
//  CodeCoverage
//
//  Created by Lidiomar Fernando dos Santos Machado on 02/08/21.
//

import Foundation
import UIKit

class CoveredClass {
    
    private(set) var area: Int
    var width:Int {
        didSet {
            area = width * width
            let color: UIColor = redOrGreen(for: width)
            drawSquare(width: width, color: color)
        }
    }
    
    init() {
        area = 0
        width = 0
    }
    
    private func redOrGreen(for: Int) -> UIColor {
        width % 2 == 0 ? .red : .green
    }
    
    private func drawSquare(width: Int, color: UIColor) {
        // bla
    }
    
    static func max(_ x: Int, _ y: Int) -> Int {
        if x < y {
            return y
        }
        return x
    }
    
    static func commaSeparated(from: Int, to: Int) -> String {
        var result = ""
        for i in from..<to {
            result += "\(i),"
        }
        result += "\(to)"
        
        return result
    }
}
