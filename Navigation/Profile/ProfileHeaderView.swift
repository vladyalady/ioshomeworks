//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Vladislav Barinov on 10.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setAllConstreints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let userImage: UIImageView = {

        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "zxc")
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = 50
        image.clipsToBounds = true

        return image
    }()

    let userLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hipster Cat"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)

        return label
    }()

    let statusLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Waiting for something..."
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)

        return label
    }()
    

    let showButton: UIButton = {

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        button.setTitle("Show status", for: .normal)
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

    

    @objc func pressButton() {

        print("Helo")
        
    }


    func setAllConstreints() {

        [userImage,userLabel,showButton,statusLabel].forEach(self.addSubview(_:))

        userImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        userImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        userImage.heightAnchor.constraint(equalToConstant: 100).isActive = true


        userLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27).isActive = true
        userLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 35).isActive = true
        userLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true

        statusLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 35).isActive = true
        statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        statusLabel.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 39).isActive = true




        showButton.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 16).isActive = true
        showButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //showButton.widthAnchor.constraint(equalToConstant: 500).isActive = true
        showButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 76).isActive = true
        showButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true



    }


}
