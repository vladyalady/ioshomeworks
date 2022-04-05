//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Vladislav Barinov on 04.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let posts = Post.getData()
    let photos = Photo.getPhoto()

    private lazy var headerView: ProfileHeaderView = {
        let headerView = ProfileHeaderView()

        return headerView
    }()

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identidier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identidier)

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }

    private func layout() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([

            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

extension ProfileViewController: UITableViewDataSource {


    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if section == 0 {
            return 1
        } else {

        return  posts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        if indexPath.section == 0 {

            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identidier, for: indexPath) as! PhotosTableViewCell
            cell.collectionView.delegate = self


            return cell
        } else {

            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identidier, for: indexPath) as! PostTableViewCell
            let post = posts[indexPath.row]
            cell.setupVC(model: post)

            return cell
        }
    }


}

extension ProfileViewController: UITableViewDelegate {


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
        return UITableView.automaticDimension
        } else {
        return 150
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        if section == 0 {
            return 225
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return headerView
        }
        return nil
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let photoVC = PhotosViewController()
        photoVC.title = "Photo Gallery"
        navigationController?.pushViewController(photoVC, animated: true)
    }

    private var sideInset: CGFloat { return 12 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (collectionView.bounds.width - sideInset * 3) / 4

        return CGSize(width: width, height: width)
    }
}
