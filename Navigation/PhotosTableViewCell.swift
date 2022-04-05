//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Vladislav Barinov on 28.03.2022.
//

import UIKit
//тейбдвтюсел
class PhotosTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {


    var photoArray = Photo.getPhoto()

    private lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)

        return label
    }()

     lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PhotosTableCollectionViewCell.self, forCellWithReuseIdentifier: PhotosTableCollectionViewCell.identidier)
        collectionView.dataSource = self
        collectionView.delegate = self

        return collectionView
    }()

    private lazy var buttonToGalary: UIButton = {

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.setTitle("➔", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        [collectionView, photosLabel, buttonToGalary].forEach { contentView.addSubview($0) }

        NSLayoutConstraint.activate([

            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

            buttonToGalary.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            buttonToGalary.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),

            collectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: photosLabel.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            collectionView.trailingAnchor.constraint(equalTo: buttonToGalary.trailingAnchor)
        ])
    }

    @objc private func buttonTapped() {
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let photo = photoArray[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosTableCollectionViewCell.identidier, for: indexPath) as! PhotosTableCollectionViewCell
        cell.photosImageView.image = UIImage(named: photo.imageName)

        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
//    }

}





