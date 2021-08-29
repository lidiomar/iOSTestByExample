//
//  TestHelpers.swift
//  RefactorTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 28/08/21.
//

import Foundation
import XCTest

func verifyMethodCalledOnce( methodName: String,
                             callCount: Int,
                             describeArguments: @autoclosure () -> String,
                             file: StaticString = #file,
                             line: UInt = #line) -> Bool {
    if callCount == 0 {
        XCTFail("Wanted but not invoked: \(methodName)",
        file: file, line: line)
        return false
    }
    
    if callCount > 1 {
        XCTFail("Wanted 1 time but was called \(callCount) times. " + "\(methodName) with \(describeArguments())",
        file: file, line: line)
        return false
    }
    return true
}

func verifyMethodNeverCalled( methodName: String,
                              callCount: Int,
                              describeArguments: @autoclosure () -> String,
                              file: StaticString = #file,
                              line: UInt = #line) {
    
    let times = callCount == 1 ? "time" : "times"
    
    if callCount > 0 {
        XCTFail("Never wanted but was called \(callCount) \(times). " + "\(methodName) with \(describeArguments())",
        file: file, line: line)
    }
}

func systemItem(for barButtomItem: UIBarButtonItem) -> UIBarButtonItem.SystemItem {
    let systemItem = barButtomItem.value(forKey: "systemItem") as! Int
    return UIBarButtonItem.SystemItem(rawValue: systemItem)!
}

func tap(_ button: UIBarButtonItem) {
    _ = button.target?.perform(button.action, with: nil)
}

func tap(_ button: UIButton) {
    button.sendActions(for: .touchUpInside)
}

func putInViewHierarchy(_ vc: UIViewController) {
    let window = UIWindow()
    window.addSubview(vc.view)
}

func executeRunLoop() {
    RunLoop.current.run(until: Date())
}

extension UIBarButtonItem.SystemItem: CustomStringConvertible {
    public var description: String {
        switch self {
        case .done: return "done"
        case .cancel: return "cancel"
        case .edit: return "edit"
        case .save: return "save"
        case .add: return "add"
        case .flexibleSpace: return "flexibleSpace"
        case .fixedSpace: return "fixedSpace"
        case .compose: return "compose"
        case .reply: return "reply"
        case .action: return "action"
        case .organize: return "organize"
        case .bookmarks: return "bookmarks"
        case .search: return "search"
        case .refresh: return "refresh"
        case .stop: return "stop"
        case .camera: return "camera"
        case .trash: return "trash"
        case .play: return "play"
        case .pause: return "pause"
        case .rewind: return "rewind"
        case .fastForward: return "fastForward"
        case .undo: return "undo"
        case .redo: return "redo"
        case .pageCurl: return "pageCurl"
        case .close: return "close"
        @unknown default: fatalError("Unknown UIBarButtonItem.SystemItem")
        }
    }
}
