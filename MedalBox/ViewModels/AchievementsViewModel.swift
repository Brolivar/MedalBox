//
//  AchievementsViewModel.swift
//  MedalBox
//
//  Created by Jose Bolivar on 26/11/24.
//

protocol AchievementsDataSource {
    func requestAchievements(completion: @escaping () -> Void)
    func filterAchievements(by category: AchievementCategory) -> [Achievement]
}

class AchievementsViewModel {

    // MARK: - Properties
    var achievements: [Achievement] = []
    var networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.achievements = []
        self.networkManager = networkManager
    }
}

// MARK: AchievementManager extension
extension AchievementsViewModel: AchievementsDataSource {

    func filterAchievements(by category: AchievementCategory) -> [Achievement] {
        // Filter and return achievements by the provided category
        return achievements.filter { $0.category == category.description() }
    }

    func requestAchievements(completion: @escaping () -> Void) {

        self.networkManager.downloadAchievements { [weak self] result in
            switch result {
            case .success(let achievements):
                self?.achievements = achievements
            case .failure(let error):
                print("Error: \(error)")
            }
            completion()
        }
    }

}
