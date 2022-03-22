//
//  LogInViewController.swift
//  Navigation
//
//  Created by Vladislav Barinov on 21.03.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private let nc = NotificationCenter.default

    private let scrollView: UIScrollView = {

        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .yellow

        return scrollView
    }()

    private let contentView: UIView = {

        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.backgroundColor = .white

        return content
    }()

    private lazy var button: UIButton = {

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "blue_pixel.png"), for: .normal)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        return button
    }()

    private let logoImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "logo")

        return $0
    }(UIImageView())

    private lazy var textField1: UITextField = {

        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Email or phone"
        tf.delegate = self
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tf.backgroundColor = .systemGray6
        tf.autocapitalizationType = .none
        tf.textColor = .black
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)

        return tf
    }()

    private lazy var textField2: UITextField = {

        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Password"
        tf.delegate = self
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        tf.autocapitalizationType = .none
        tf.isSecureTextEntry = true
        tf.backgroundColor = .systemGray6
        tf.textColor = .black
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)

        return tf
    }()

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fillEqually

        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        self.navigationController?.navigationBar.isHidden = true
        layout()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        nc.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)

    }

    @objc private func keyboardWillShow(notification: NSNotification) {

        if let kbrSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbrSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0,
                                                                    left: 0,
                                                                    bottom: kbrSize.height,
                                                                    right: 0)

        }
    }

    @objc private func keyboardWillHide() {

        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    @objc func buttonTapped(_ sender: UIButton) {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }


    private func layout() {

        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)

        ])

        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        [textField1, textField2].forEach { stackView.addSubview($0) }

        [logoImageView, stackView,textField1,textField2, button].forEach { contentView.addSubview($0) }

        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])

        NSLayoutConstraint.activate([

            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
//            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            textField1.topAnchor.constraint(equalTo: stackView.topAnchor),
            textField1.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            textField1.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            textField1.heightAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor),
            textField2.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            textField2.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            textField2.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])

    }
}

extension LogInViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}

