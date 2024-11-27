//
//  MedalBoxTests.swift
//  MedalBoxTests
//
//  Created by Jose Bolivar on 26/11/24.
//

import XCTest
@testable import MedalBox

// These tests will verify that the AchievementsViewModel properly interacts with the NetworkManager and loads the achievements,
// filters them by category, and counts completed ones.
class AchievementsViewModelTests: XCTestCase {

    var viewModel: AchievementsViewModel!
    var networkManager: NetworkManager!

    // Setup method for each test
    override func setUp() {
        super.setUp()

        // Initialize the NetworkManager and ViewModel
        networkManager = NetworkManager()
        viewModel = AchievementsViewModel(networkManager: networkManager)
    }

    // Test if achievements are loaded correctly
    func testAchievementsLoading() {
        let expectation = self.expectation(description: "Achievements are loaded")

        // Simulate downloading achievements
        viewModel.requestAchievements {
            XCTAssertGreaterThan(self.viewModel.totalAchievements(), 0, "No achievements were loaded.")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1, handler: nil)
    }

    // Test filtering achievements by category
    func testAchievementsFilteringByPersonalRecords() {
        let expectation = self.expectation(description: "Achievements are filtered by category")

        // Simulate downloading achievements
        viewModel.requestAchievements {
            let personalRecords = self.viewModel.filterAchievements(by: .personalRecords)
            XCTAssertEqual(personalRecords.count, 6, "The count of Personal Records achievements is incorrect.")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1, handler: nil)
    }

    // Test filtering achievements by category
    func testAchievementsFilteringByVirtualRaces() {
        let expectation = self.expectation(description: "Achievements are filtered by category")

        // Simulate downloading achievements
        viewModel.requestAchievements {
            let personalRecords = self.viewModel.filterAchievements(by: .virtualRaces)
            XCTAssertEqual(personalRecords.count, 5, "The count of Personal Records achievements is incorrect.")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1, handler: nil)
    }

    // Test counting completed achievements in a category
    func testCompletedAchievementsCountInCategory() {
        let expectation = self.expectation(description: "Completed achievements are counted by category")

        // Simulate downloading achievements
        viewModel.requestAchievements {
            let completedCount = self.viewModel.achievementsCompleted(for: .personalRecords)
            XCTAssertEqual(completedCount, 4, "The number of completed achievements in Personal Records is incorrect.")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1, handler: nil)
    }

    // Test counting all completed achievements
    func testAllCompletedAchievementsCount() {
        let expectation = self.expectation(description: "All completed achievements are counted")

        // Simulate downloading achievements
        viewModel.requestAchievements {
            let completedCount = self.viewModel.allCompleted()
            XCTAssertEqual(completedCount, 7, "The total number of completed achievements is incorrect.")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1, handler: nil)
    }

    // Test if the correct achievement is returned at a given index
    func testAchievementAtIndex() {
        let expectation = self.expectation(description: "Achievement at specific index is retrieved")

        // Simulate downloading achievements
        viewModel.requestAchievements {
            let achievement = self.viewModel.achievementAt(index: 0)
            XCTAssertNotNil(achievement, "No achievement found at index 0.")
            XCTAssertEqual(achievement?.name, "Longest Run", "Achievement name is incorrect.")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1, handler: nil)
    }

}
