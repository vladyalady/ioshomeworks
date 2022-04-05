//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Vladislav Barinov on 10.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    private var statusText: String = ""

    override init(frame: CGRect) {

        super.init(frame: frame)
        setupView()
        setAllConstreints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let userImage: UIImageView = {

        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "zxc")
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = 65
        image.clipsToBounds = true

        return image
    }()

    private let userLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hipster Cat"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)

        return label
    }()

    private let statusLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Waiting for something..."
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)

        return label
    }()
    

    private let showButton: UIButton = {

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

    private let statusTextField: UITextField = {

        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(pressTextField), for: .editingChanged)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.placeholder = " Change status"

        return textField
    }()

    @objc func pressButton() {

        if statusTextField.text != nil {
        statusLabel.text = statusText
        } else {
            statusTextField.text = ""
        }
    }

    @objc func pressTextField(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        statusText = text

    }

    private func setupView() {
        addSubview(userImage)
        addSubview(userLabel)
        addSubview(statusLabel)
        addSubview(showButton)
        addSubview(statusTextField)
    }


    private func setAllConstreints() {

        userImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        userImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: 130).isActive = true
        userImage.heightAnchor.constraint(equalToConstant: 130).isActive = true


        userLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27).isActive = true
        userLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 35).isActive = true
        userLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true

        statusLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 35).isActive = true
        statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        statusLabel.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 35).isActive = true

        showButton.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 16).isActive = true
        showButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        showButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        showButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true


        statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10).isActive = true
        statusTextField.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 35).isActive = true
        statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        statusTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

    }
}
