//
//  Achievement.swift
//  MedalBox
//
//  Created by Jose Bolivar on 26/11/24.
//

class Achievement: Codable {

    var name: String
    var category: String
    var duration: String
    var medalIcon: String
    var completed: Bool

    enum CodingKeys: String, CodingKey {
        case name
        case category
        case duration
        case medalIcon
        case completed
    }

    init(name: String, category: String, duration: String, medalIcon: String, completed: Bool) {
        self.name = name
        self.category = category
        self.duration = duration
        self.medalIcon = medalIcon
        self.completed = completed
    }
}

// Note: In a real API response, and in case the number of categories is dynamic, we won't need for a predefined enum, and should probably
// organise stuff in VM using a dictionary
enum AchievementCategory: Int, CaseIterable {
    case personalRecords
    case virtualRaces

    func description() -> String {
        switch self {
        case .personalRecords: return "Personal Records"
        case .virtualRaces: return "Virtual Races"
        }
    }
}

// This would typically be in a separate file, but since there is no actual networking implementation in this case,
// I have simplified it by including the response structure here for convenience.
struct AchievementResponse: Codable {
    var achievements: [Achievement]
}
