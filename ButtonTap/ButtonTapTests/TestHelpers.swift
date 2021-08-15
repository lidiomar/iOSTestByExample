//
//  TestHelpers.swift
//  ButtonTapTests
//
//  Created by Lidiomar Fernando dos Santos Machado on 06/08/21.
//

import Foundation
import UIKit

func tap(_ button: UIButton) {
    button.sendActions(for: .touchUpInside)
}
