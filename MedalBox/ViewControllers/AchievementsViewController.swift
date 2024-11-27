//
//  AchievementsViewController.swift
//  MedalBox
//
//  Created by Jose Bolivar on 26/11/24.
//

import UIKit

class AchievementsViewController: UIViewController {

    // MARK: - Properties
    weak var coordinator: MainCoordinator?
    var viewModel: AchievementsDataSource?
    @IBOutlet private var collectionView: UICollectionView!
    let cellIdentifier = "AchievementCell"
    let headerIdentifier = "AchievementHeader"
    let navigationTitle = "Achievements"
    let headerHeight: CGFloat = 50.0

    // MARK: - Initialisation
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupCollectionView()
    }

    private func setupNavigationBar() {
        self.title = self.navigationTitle
        // Add the three vertical dots button (more menu) to the right of the navigation bar
        if let moreIcon = UIImage(systemName: "ellipsis") {
            let moreButton = UIBarButtonItem(image: moreIcon, style: .plain, target: self, action: #selector(moreButtonTapped))
            self.navigationItem.rightBarButtonItem = moreButton
        }
    }

    private func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.backgroundColor = .white
        self.collectionView.indicatorStyle = .black
        self.collectionView.showsVerticalScrollIndicator = true

        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionHeadersPinToVisibleBounds = true
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }

    // MARK: - Actions
    @objc func moreButtonTapped() {
        // Feature functionality undefined
    }

}

// MARK: - UICollectionViewDataSource extension
extension AchievementsViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return AchievementCategory.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.filterAchievements(by: AchievementCategory.allCases[section]).count ?? 0
    }

}

// MARK: - UICollectionViewDelegateFlowLayout extension
extension AchievementsViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as? AchievementCollectionViewCell else {
            print("Unable to dequeue AchievementCollectionViewCell")
            return UICollectionViewCell()
        }
        let filteredAchievements = self.viewModel?.filterAchievements(by: AchievementCategory.allCases[indexPath.section])

        if let achievement = filteredAchievements?[indexPath.row] {
            cell.configure(title: achievement.name, subtitle: achievement.duration, medalIcon: achievement.medalIcon, completed: achievement.completed)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:collectionView.frame.size.width, height: self.headerHeight)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: self.headerIdentifier, for: indexPath) as? HeaderView else {
            print("Unable to dequeue HeaderView")
            return UICollectionReusableView()
        }

        let section = indexPath.section
        if section == AchievementCategory.virtualRaces.rawValue {
            header.configure(title: AchievementCategory.virtualRaces.description(), subtitle: nil)
        } else {
            // Display the number of completed achievements (also with a generic fallback)
            let achievementsCompleted = self.viewModel?.achievementsCompleted(for: .personalRecords)
            let totalAchievements = self.viewModel?.filterAchievements(by: .personalRecords).count
            let progressText = "\(achievementsCompleted ?? 0) of \(totalAchievements ?? 10)"

            header.configure(title: AchievementCategory.personalRecords.description(), subtitle: progressText)
        }

        return header
    }
}
