//
//  AppColors.swift
//  MedalBox
//
//  Created by Jose Bolivar on 26/11/24.
//

import UIKit

enum AssetsColor: String {
    case deepGrayText = "deepGrayText"
    case grayHeader = "grayHeader"
    case lightGrayHeader = "lightGrayHeader"
    case navBarTurquoise = "navBarTurquoise"
    case pureBlack = "pureBlack"
    case pureWhite = "pureWhite"
}

extension UIColor {
    // Some SystemColors fallback could be added in the future so we don't unwrap every time we use it
    static func appColor(_ name: AssetsColor) -> UIColor? {
        return UIColor(named: name.rawValue)
    }
}
