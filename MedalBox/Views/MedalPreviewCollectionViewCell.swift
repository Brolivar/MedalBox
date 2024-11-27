//
//  MedalPreviewCollectionViewCell.swift
//  MedalBox
//
//  Created by Jose Bolivar on 27/11/24.
//

import UIKit

class MedalPreviewCollectionViewCell: UICollectionViewCell {

    // MARK:: - Properties
    @IBOutlet private var medalPreviewImage: UIImageView!
    @IBOutlet private var dimmedView: UIView!

    override func prepareForReuse() {
        self.medalPreviewImage.image = nil
    }

    func configure(with image: String, completed: Bool) {
        // Ensure the image exists
        if let loadedImage = UIImage(named: image) {
            self.medalPreviewImage.image = loadedImage
        } else {
            print("Error: Image not found for name: \(image)")
            // Optionally, set a placeholder image if the image is not found
            self.medalPreviewImage.image = UIImage(named: "ellipsis")
        }
        self.configureDimmedView(completed: completed)
    }

    private func configureDimmedView(completed: Bool) {
        self.dimmedView.isHidden = completed
        self.dimmedView.backgroundColor = UIColor.appColor(.transparentWhite)
    }
}
