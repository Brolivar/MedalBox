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
    func totalAchievements() -> Int
    func achievementAt(index: Int) -> Achievement?
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

    func achievementsCompleted(for category: AchievementCategory) -> Int {
        // Filter achievements by the given category and count those that are completed
        return achievements.filter { $0.category == category.description() && $0.completed }.count
    }

    func allCompleted() -> Int {
        return achievements.filter { $0.completed }.count
    }

    func totalAchievements() -> Int {
        return achievements.count
    }

    func achievementAt(index: Int) -> Achievement? {
        guard index >= 0 && index < achievements.count else {
            print("Index out of bounds: \(index)")
            return nil
        }
        return achievements[index]
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
