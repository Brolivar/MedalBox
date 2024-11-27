//
//  AchievementCollectionViewCell.swift
//  MedalBox
//
//  Created by Jose Bolivar on 27/11/24.
//

import UIKit

class AchievementCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties
    @IBOutlet private var badgeImage: UIImageView!
    @IBOutlet private var mainTitle: UILabel!
    @IBOutlet private var subTitle: UILabel!
    @IBOutlet private var dimmedView: UIView!

    // MARK: - Initialisation
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        self.badgeImage.image = nil
        self.mainTitle.text = nil
        self.subTitle.text = nil
        self.dimmedView.isHidden = true
    }

    func configure(title: String, subtitle: String, medalIcon: String, completed: Bool) {
        // In a real-world scenario, we would download the image asynchronously using a dataTask or a third-party lib
        self.badgeImage.image = UIImage(named: medalIcon)
        self.mainTitle.text = title
        self.mainTitle.textColor = .black
        self.mainTitle.font = UIFont.appFont(size: .small, weight: .bold)
        self.mainTitle.numberOfLines = 0

        self.subTitle.text = subtitle
        self.subTitle.font = UIFont.appFont(size: .small)
        self.subTitle.textColor = .black
        self.subTitle.numberOfLines = 1

        self.setupDimmedView(completed: completed)
    }

    func setupDimmedView(completed: Bool) {
        self.dimmedView.isHidden = completed
        self.dimmedView.backgroundColor = UIColor.appColor(.transparentWhite)
    }
}
