//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Vladislav Barinov on 31.03.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    var photoArray = Photo.getPhoto()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.translatesAutoresizingMaskIntoConstraints = false
        collView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identidier)
        collView.dataSource = self
        collView.delegate = self

        return collView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        navigationController?.navigationBar.isHidden = false
    }

    private func layout() {
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension PhotosViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    private var sideInset: CGFloat { return 8 }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identidier, for: indexPath) as! PhotoCollectionViewCell
        let photo = photoArray[indexPath.row]
        cell.photosImageView.image = UIImage(named: photo.imageName)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (collectionView.bounds.width - sideInset * 4) / 3

        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
}
