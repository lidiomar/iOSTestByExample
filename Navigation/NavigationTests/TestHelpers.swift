//
//  TestHelpers.swift
//  NavigationTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 09/08/21.
//

import Foundation
import UIKit

func tap(_ button: UIButton) {
    button.sendActions(for: .touchUpInside)
}

func executeRunLoop() {
    RunLoop.current.run(until: Date())
}
