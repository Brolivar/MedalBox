//
//  MainCoordinator.swift
//  MedalBox
//
//  Created by Jose Bolivar on 26/11/24.
//

import UIKit.UINavigationController

// Note: Currently, the navigation is simple and handled by the MainCoordinator.
// If the app grows or if additional screens are added, consider introducing a protocol
// (e.g., AppPresenterDelegate) to handle delegation for navigation and manage child coordinators.
class MainCoordinator: Coordinator {

    var navigationController: UINavigationController
    var achievementsVm: AchievementsViewModel?
    // This way we only use one shared instance of networkManager
    var networkManger: NetworkManager

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.networkManger = NetworkManager()
    }

    func start() {
        // Instantiate MainViewController from storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController {
            // Set the coordinator for MainVC
            self.achievementsVm = AchievementsViewModel(networkManager: self.networkManger)
            mainVC.coordinator = self
            mainVC.viewModel = self.achievementsVm

            // Push MainVC to the navigation stack
            self.navigationController.pushViewController(mainVC, animated: true)
        }
    }

    func goToAchievements() {
        // Instantiate AchievementsViewController from storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let achievementsVC = storyboard.instantiateViewController(withIdentifier: "AchievementsViewController") as? AchievementsViewController {
            // Set the coordinator for AchievementsVC
            achievementsVC.coordinator = self
            achievementsVC.viewModel = self.achievementsVm
            // Push AchievementsVC to the navigation stack
            self.navigationController.pushViewController(achievementsVC, animated: true)
        }
    }
}
