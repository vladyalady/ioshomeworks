//
//  PhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Vladislav Barinov on 31.03.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    var photosImageView: UIImageView = {
        let photoImage = UIImageView()
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        photoImage.contentMode = .scaleToFill


        return photoImage
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        contentView.addSubview(photosImageView)

        NSLayoutConstraint.activate([
            photosImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photosImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photosImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photosImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
