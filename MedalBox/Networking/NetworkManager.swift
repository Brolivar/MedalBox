//
//  NetworkManager.swift
//  MedalBox
//
//  Created by Jose Bolivar on 26/11/24.
//
import Foundation

protocol NetworkControllerProtocol: AnyObject {
    func downloadAchievements(completion: @escaping (Result<[Achievement], Error>) -> Void)
}

// MARK: There is no real networking in this assignment.
// To get it closer to a realistic scenario with API requests, I created sample data in a JSON file.
// The app reads and parses this JSON to mimic the behavior of fetching data from a network request.

class NetworkManager {}

extension NetworkManager: NetworkControllerProtocol {

    func downloadAchievements(completion: @escaping (Result<[Achievement], Error>) -> Void) {

        let filename = "sampleData"
        if let url = Bundle.main.url(forResource: filename, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let response = try decoder.decode(AchievementResponse.self, from: data)
                let achievements = response.achievements
                print("achievments \(achievements)")
                completion(.success(achievements))
            } catch {
                print("Error decoding JSON: \(error)")
                completion(.failure(error))
            }
        }
    }
}
