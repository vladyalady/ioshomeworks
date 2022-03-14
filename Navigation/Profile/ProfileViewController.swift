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
    }

    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = self.view.frame
        view.addSubview(profileHeaderView)
    }
}
