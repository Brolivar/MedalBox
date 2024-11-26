//
//  Coordinator.swift
//  MedalBox
//
//  Created by Jose Bolivar on 26/11/24.
//

// Note: The navigation flow in this app is currently simple, so the coordinator pattern remains lightweight.
// However, if the navigation structure becomes more complex in the future (e.g., multiple screens or nested flows),
// we would need to implement child coordinator management (add, remove..) to better organize and handle these additional flows.
protocol Coordinator {
    func start()
    func goToAchievements()
}
