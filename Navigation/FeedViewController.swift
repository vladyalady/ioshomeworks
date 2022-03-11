//
//  FeedViewController.swift
//  Navigation
//
//  Created by Vladislav Barinov on 04.03.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "Russian News Today")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        addPostButton()
    }


    @objc func buttonTapped() {
        let postVC = PostViewController()
        postVC.newPost = post
        navigationController?.pushViewController(postVC, animated: true)

    }

    private func addPostButton() {

        let postButton = UIButton()
        postButton.translatesAutoresizingMaskIntoConstraints = false

        postButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        postButton.setTitle("Check post", for: .normal)
        postButton.setTitleColor(.white, for: .normal)
        postButton.backgroundColor = .systemPink
        postButton.layer.cornerRadius = 20
        postButton.layer.cornerRadius = 14
        postButton.layer.shadowColor = UIColor.black.cgColor
        postButton.layer.shadowRadius = 4
        postButton.layer.shadowOpacity = 0.7
        postButton.layer.shadowOffset.height = 4
        postButton.layer.shadowOffset.width = 4


        view.addSubview(postButton)



        let horizontalCenter = NSLayoutConstraint(item: postButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)

        let verticalCenter = NSLayoutConstraint(item: postButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0)

        let width = NSLayoutConstraint(item: postButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: 100)

        let height = NSLayoutConstraint(item: postButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 50)

        let constraints: [NSLayoutConstraint] = [horizontalCenter, verticalCenter, width, height]

        NSLayoutConstraint.activate(constraints)
    }
}
