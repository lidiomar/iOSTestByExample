//
//  TestHelpers.swift
//  TextFieldTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 18/08/21.
//

import Foundation
import UIKit

extension UITextContentType: CustomStringConvertible {
    public var description: String { rawValue }
}

extension UITextAutocorrectionType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .default:
            return "default"
        case .no:
            return "no"
        case .yes:
            return "yes"
        @unknown default:
            return "unknown"
        }
    }
}

extension UIReturnKeyType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .continue:
            return "continue"
        case .join:
            return "join"
        case .default:
            return "default"
        case .done:
            return "done"
        case .emergencyCall:
            return "emergencyCall"
        case .google:
            return "google"
        case .next:
            return "next"
        case .go:
            return "go"
        case .route:
            return "route"
        case .search:
            return "search"
        case .send:
            return "send"
        case .yahoo:
            return "yahoo"
        @unknown default:
            return "unknown"
        }
    }
}

func shouldChangeCharacteres(_ textField: UITextField,
         shouldChangeCharactersIn: NSRange = NSRange(),
         replacementString: String) -> Bool? {
    
    return textField.delegate?.textField?(
        textField,
        shouldChangeCharactersIn: NSRange(),
        replacementString: replacementString)
}

@discardableResult func shouldReturn(in textField: UITextField) -> Bool? {
    textField.delegate?.textFieldShouldReturn?(textField)
}

func putInViewHierarchy(_ vc: UIViewController) {
    let window = UIWindow()
    window.addSubview(vc.view)
}

func executeRunLoop() {
    RunLoop.current.run(until: Date())
}
