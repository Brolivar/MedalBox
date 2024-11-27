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
        self.requestAchievements()
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
        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionHeadersPinToVisibleBounds = true
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }

    private func requestAchievements() {
        self.viewModel?.requestAchievements(completion: { [weak self] in
            self?.collectionView.reloadData()
        })
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
            return UICollectionReusableView()
        }

        let section = indexPath.section
        if section == AchievementCategory.virtualRaces.rawValue {
            header.configure(title: AchievementCategory.virtualRaces.description(), subtitle: nil)
        } else {
            header.configure(title: AchievementCategory.personalRecords.description(), subtitle: "0 of 10")
        }

        return header
    }
}
