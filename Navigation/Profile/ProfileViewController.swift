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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        title = "Profile"

        view.addSubview(profileHeaderView)
    }

    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = view.frame
    }
}
