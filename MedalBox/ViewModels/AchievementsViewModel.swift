//
//  AchievementsViewModel.swift
//  MedalBox
//
//  Created by Jose Bolivar on 26/11/24.
//

protocol AchievementsDataSource {
    func requestAchievements(completion: @escaping () -> Void)
    func filterAchievements(by category: AchievementCategory) -> [Achievement]
    func achievementsCompleted(for category: AchievementCategory) -> Int
    func allCompleted() -> Int
}

class AchievementsViewModel {

    // MARK: - Properties

    // Note: An alternative approach would be to group the achievements using a dictionary with categories as keys.
    // This would offer greater flexibility and scalability, especially if the number or names of categories were to change dynamically.
    // However, to keep things simple and align with the provided UI mock, I opted to use an enum for a static structure.
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

    func achievementsCompleted(for category: AchievementCategory) -> Int {
        // Filter achievements by the given category and count those that are completed
        return achievements.filter { $0.category == category.description() && $0.completed }.count
    }

    func allCompleted() -> Int {
        return achievements.filter { $0.completed }.count
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
