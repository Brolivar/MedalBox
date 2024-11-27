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
    let medalPreviewCellId = "MedalPreviewCell"
    var savedLabelText: String?

    // BONUS: display number of completed achievements here - similar to Runkeeper profile app :)
    @IBOutlet private var goToAchievementsButton: UIButton!
    @IBOutlet private var medalCollectionView: UICollectionView!

    // MARK: - Initialisation
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.navigationTitle
        self.requestAchievements()
        self.setupCollectionView()
    }

    private func setCompletedAchievementsTile() {
        let completedText = "Achievements(\(self.viewModel?.allCompleted() ?? 0))"

        // Create an attributed string with custom styling (e.g., bold for the achievements count)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.appFont(size: .large, weight: .bold),
            .foregroundColor: UIColor.black
        ]
        let attributedTitle = NSAttributedString(string: completedText, attributes: attributes)
        self.goToAchievementsButton.setAttributedTitle(attributedTitle, for: .normal)
    }

    private func requestAchievements() {
        // Preload: Ideally, this logic would belong in AchievementsVC for better separation of concerns.
        // However, it's implemented here to align with a similar UI approach used in the ASICS Runkeeper profile.
        self.viewModel?.requestAchievements(completion: { [weak self] in
            self?.setCompletedAchievementsTile()
            self?.medalCollectionView.reloadData()
        })
    }

    private func setupCollectionView() {
        self.medalCollectionView.dataSource = self
        self.medalCollectionView.delegate = self
        self.medalCollectionView.backgroundColor = .white
        self.medalCollectionView.indicatorStyle = .black
        self.medalCollectionView.showsHorizontalScrollIndicator = true
        if let layout = self.medalCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }

    // MARK: - Actions
    @IBAction private func achievementsTapped(_ sender: Any) {
        self.coordinator?.goToAchievements()
    }
    
}

// MARK: - UICollectionViewDelegate UICollectionViewDataSource extensions
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.totalAchievements() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.medalPreviewCellId, for: indexPath) as? MedalPreviewCollectionViewCell else {
            print("Unable to dequeue MedalPreviewCollectionViewCell")
            return UICollectionViewCell()
        }

        if let achievement = self.viewModel?.achievementAt(index: indexPath.row) {
            cell.configure(with: achievement.medalIcon, completed: achievement.completed)
        }
        return cell
    }

}
