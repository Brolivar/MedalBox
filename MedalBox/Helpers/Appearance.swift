//
//  Appearance.swift
//  MedalBox
//
//  Created by Jose Bolivar on 26/11/24.
//

import UIKit

// MARK: - Navigation Bar Appearance Configuration
class NavigationBarAppearance {
    static func configureNavigationBar() {
        // Create an appearance object for the navigation bar
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.appColor(.navBarTurquoise)
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.appFont(size: .navigationHeader, weight: .bold)
        ]

        // Customize the back button appearance
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.backButtonAppearance = backButtonAppearance

        // Set the appearance for both the standard and scroll edge states
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

        // Set the tint color of the navigation bar
        UINavigationBar.appearance().tintColor = UIColor.white
    }
}

