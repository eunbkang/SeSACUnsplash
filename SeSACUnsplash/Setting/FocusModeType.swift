//
//  FocusModeType.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/18.
//

import UIKit

enum FocusModeType: Int, CaseIterable {
    case doNotDisturb
    case sleep
    case work
    case personal
    
    var color: UIColor {
        switch self {
        case .doNotDisturb:
            return .systemPurple
        case .sleep:
            return .systemOrange
        case .work:
            return .systemGreen
        case .personal:
            return .systemBlue
        }
    }
}
