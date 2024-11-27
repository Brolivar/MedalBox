//
//  HeaderView.swift
//  MedalBox
//
//  Created by Jose Bolivar on 27/11/24.
//

import UIKit

// If given more time, a XIB file could have been created to define the UI for improved reusability in case it was needed elsewhere
class HeaderView: UICollectionReusableView {

    // MARK: - Properties
    @IBOutlet private var mainTitle: UILabel!
    @IBOutlet private var subtitle: UILabel!
    static let reuseIdentifer = "HeaderView"

    // MARK: - Initialisation
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(title: String, subtitle: String?) {
        self.mainTitle.text = title
        self.mainTitle.textColor = UIColor.appColor(.deepGrayText)
        self.mainTitle.font = UIFont.appFont(size: .medium)
        if let subtitle = subtitle {
            self.subtitle.text = subtitle
            self.subtitle.font = UIFont.appFont(size: .medium)
            self.subtitle.isHidden = false
        } else {
            self.subtitle.isHidden = true
        }
        self.subtitle.textColor = UIColor.appColor(.grayHeader)
        self.backgroundColor = UIColor.appColor(.lightGrayHeader)
    }
}
