//
//  SnapshotTests.swift
//  SnapshotTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 28/08/21.
//

import FBSnapshotTestCase
@testable import Snapshot

class SnapshotTests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    func test_example() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(
            identifier: String(describing: ViewController.self)
        )
        
        FBSnapshotVerifyViewController(sut)
        
    }

}
