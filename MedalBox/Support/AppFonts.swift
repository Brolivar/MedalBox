//
//  AppFonts.swift
//  MedalBox
//
//  Created by Jose Bolivar on 26/11/24.
//
import UIKit

enum StandardFontSize: CGFloat {
    case small = 12
    case medium = 14
    case large = 16
}

extension UIFont {
    // Standard font
    static func appFont(size: StandardFontSize, weight: UIFont.Weight = .regular) -> UIFont {
        return UIFont.systemFont(ofSize: size.rawValue, weight: weight)
    }
}

