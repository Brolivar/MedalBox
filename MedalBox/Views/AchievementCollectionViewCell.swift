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
        self.configureTitle(title: title)
        self.configureSubtitle(subtitle: subtitle)
        self.configureDimmedView(completed: completed)
    }

    private func configureTitle(title: String) {
        self.mainTitle.text = title
        self.mainTitle.textColor = .black
        self.mainTitle.font = UIFont.appFont(size: .small, weight: .bold)
        // Two lines max - if we were to support dynamic text size we would need to adjust the layout or cell size run-time
        self.mainTitle.numberOfLines = 2
    }

    private func configureSubtitle(subtitle: String) {
        self.subTitle.text = subtitle
        self.subTitle.font = UIFont.appFont(size: .small)
        self.subTitle.textColor = .black
        self.subTitle.numberOfLines = 1
    }

    private func configureDimmedView(completed: Bool) {
        self.dimmedView.isHidden = completed
        self.dimmedView.backgroundColor = UIColor.appColor(.transparentWhite)
    }
}
