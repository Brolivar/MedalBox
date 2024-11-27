//
//  ViewController.swift
//  MedalBox
//
//  Created by Jose Bolivar on 26/11/24.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: - Properties
    weak var coordinator: MainCoordinator?
    var viewModel: AchievementsDataSource?
    let navigationTitle = "Home"

    // MARK: - Initialisation
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.navigationTitle
    }

    // MARK: - Actions
    @IBAction private func achievementsTapped(_ sender: Any) {
        self.coordinator?.goToAchievements()
    }
    
}

