//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Vladislav Barinov on 04.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView: ProfileHeaderView = {
        let profileHeader = ProfileHeaderView()

        return profileHeader
    }()

    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Оч крутая домашка", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset.height = 4
        button.layer.shadowOffset.width = 4

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        title = "Profile"
        profileHeaderView.frame = self.view.frame
        view.addSubview(profileHeaderView)
        layout()
    }

    private func layout() {

        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
