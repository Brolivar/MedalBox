//
//  AppColors.swift
//  MedalBox
//
//  Created by Jose Bolivar on 26/11/24.
//

import UIKit

enum AssetsColor: String {
    case deepGrayText = "DeepGrayText"
    case grayHeader = "GrayHeader"
    case lightGrayHeader = "LightGrayHeader"
    case navBarTurquoise = "NavBarTurquoise"
    case transparentWhite = "TransparentWhite"
}

extension UIColor {
    // Some SystemColors fallback could be added in the future
    static func appColor(_ name: AssetsColor) -> UIColor? {
        return UIColor(named: name.rawValue)
    }
}
