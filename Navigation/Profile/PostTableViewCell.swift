//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Vladislav Barinov on 24.03.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private let authorLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2

        return label
    }()

    private let descriptionLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0

        return label
    }()

    private let authorImage: UIImageView = {

        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black

        return image
    }()
    
    private let likesLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)

        return label
    }()

    private let viewsLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)

        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupVC(model: Post) {
        authorLabel.text = model.author
        authorImage.image = UIImage(named: model.image)
        descriptionLabel.text = model.description
        likesLabel.text = "Likes: \(model.likes)"
        viewsLabel.text = "Likes: \(model.views)"
    }

    private func layout() {

        [authorLabel,authorImage,descriptionLabel,likesLabel,viewsLabel].forEach { contentView.addSubview($0) }

        NSLayoutConstraint.activate([

            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            authorLabel.heightAnchor.constraint(equalToConstant: 25)
        ])

        NSLayoutConstraint.activate([

            authorImage.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            authorImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            authorImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            authorImage.heightAnchor.constraint(equalTo: contentView.widthAnchor),
        ])

        NSLayoutConstraint.activate([

            descriptionLabel.topAnchor.constraint(equalTo: authorImage.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])

        NSLayoutConstraint.activate([

            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])

        NSLayoutConstraint.activate([

            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
}
