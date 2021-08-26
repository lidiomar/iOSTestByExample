//
//  ViewControllerTests.swift
//  TableViewTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 21/08/21.
//

import Foundation
import XCTest
@testable import TableView

class ViewControllerTests: XCTestCase {
    
    private var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(
            identifier: String(describing: ViewController.self)
        )
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_tableViewDelegates_shouldBeConnected() {
        XCTAssertNotNil(sut.tableView.delegate, "delegate")
        XCTAssertNotNil(sut.tableView.dataSource, "datasource")
    }
    
    func test_numberOfRows_shouldBe3() {
        XCTAssertEqual(numberOfRows(tableView: sut.tableView), 3)
    }
    
    func test_cellForRowAt_withRow0_shouldSetCellLabelToOne() {
        let cell = cellForRowAt(tableView: sut.tableView, row: 0)
        
        XCTAssertEqual(cell?.textLabel?.text, "One")
    }
    
    func test_cellForRowAt_withRow0_shouldSetCellLabelToTwo() {
        let cell = cellForRowAt(tableView: sut.tableView, row: 1)
        
        XCTAssertEqual(cell?.textLabel?.text, "Two")
    }
    
    func test_cellForRowAt_withRow0_shouldSetCellLabelToThree() {
        let cell = cellForRowAt(tableView: sut.tableView, row: 2)
        
        XCTAssertEqual(cell?.textLabel?.text, "Three")
    }
    
    func test_didSelectRow_withRow1() {
        didSelectRow(tableView: sut.tableView, row: 0)
    }
}
