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
    // Bonus: display number of completed achievements here
    @IBOutlet private var goToAchievementsButton: UIButton!

    // MARK: - Initialisation
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.navigationTitle
        self.requestAchievements()
    }

    private func setCompletedAchievementsTile() {
        let completedText = "Achievements(\(self.viewModel?.allCompleted() ?? 0))"
        self.goToAchievementsButton.titleLabel?.text = completedText
    }

    private func requestAchievements() {
        // Preload: Ideally, this logic would belong in AchievementsVC for better separation of concerns.
        // However, it's implemented here to align with a similar UI approach used in the ASICS Runkeeper profile.
        self.viewModel?.requestAchievements(completion: { [weak self] in
            self?.setCompletedAchievementsTile()
        })
    }

    // MARK: - Actions
    @IBAction private func achievementsTapped(_ sender: Any) {
        self.coordinator?.goToAchievements()
    }
    
}

