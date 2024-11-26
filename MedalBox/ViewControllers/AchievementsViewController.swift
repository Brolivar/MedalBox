//
//  AchievementsViewController.swift
//  MedalBox
//
//  Created by Jose Bolivar on 26/11/24.
//

import UIKit

class AchievementsViewController: UIViewController {

    // MARK: - Properties
    weak var coordinator: MainCoordinator?
    let navigationTitle = "Achievements"

    // MARK: - Initialisation
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
    }

    private func setupNavigationBar() {
        self.title = self.navigationTitle
        // Add the three vertical dots button (more menu) to the right of the navigation bar
        if let moreIcon = UIImage(systemName: "ellipsis") {
            let moreButton = UIBarButtonItem(image: moreIcon, style: .plain, target: self, action: #selector(moreButtonTapped))
            self.navigationItem.rightBarButtonItem = moreButton
        }
    }

    // MARK: - Actions
    @objc func moreButtonTapped() {
        // Feature functionality undefined
    }

}
