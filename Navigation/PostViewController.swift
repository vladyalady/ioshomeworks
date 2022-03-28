//
//  PostViewController.swift
//  Navigation
//
//  Created by Vladislav Barinov on 04.03.2022.
//

import UIKit

class PostViewController: UIViewController {

    var newPost: Post?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray4
//        title = newPost?.title

        addTabBarButton()
    }

    @objc func pressBarButton() {

        let infoVC = InfoViewController()
        present(infoVC, animated: true)
    }

    private func addTabBarButton() {

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressBarButton))
    }
}
