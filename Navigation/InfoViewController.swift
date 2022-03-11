//
//  InfoViewController.swift
//  Navigation
//
//  Created by Vladislav Barinov on 04.03.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        addAlertButton()
    }
    func addAlertButton() {
        let alertButton = UIButton()
        alertButton.setTitle("Alert", for: .normal)
        alertButton.setTitleColor(.white, for: .normal)
        alertButton.backgroundColor = .systemMint
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        alertButton.addTarget(self, action: #selector(pressAlertButton), for: .touchUpInside)
        alertButton.layer.cornerRadius = 20
        alertButton.layer.cornerRadius = 14
        alertButton.layer.shadowColor = UIColor.black.cgColor
        alertButton.layer.shadowRadius = 4
        alertButton.layer.shadowOpacity = 0.7
        alertButton.layer.shadowOffset.height = 4
        alertButton.layer.shadowOffset.width = 4

        view.addSubview(alertButton)



        let horizontalCenter = NSLayoutConstraint(item: alertButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)

        let verticalCenter = NSLayoutConstraint(item: alertButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0)

        let width = NSLayoutConstraint(item: alertButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: 100)

        let height = NSLayoutConstraint(item: alertButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 50)

        let constraints: [NSLayoutConstraint] = [horizontalCenter, verticalCenter, width, height]

        NSLayoutConstraint.activate(constraints)
    }


    @objc func pressAlertButton() {
        let alert = UIAlertController(title: "Мои поздравления", message: "Вы дошли до конца!", preferredStyle: .alert)
        let alertFirstAction = UIAlertAction(title: "Еще готовы продолжать?", style: .cancel) { _ in
            print("Извините, но дальше вам пути закрыты!")
        }
        let alertSecondAction = UIAlertAction(title: "Конец конца", style: .destructive) { _ in
            print("Game over, мои поздравления!")
        }
        alert.addAction(alertSecondAction)
        alert.addAction(alertFirstAction)
        present(alert, animated: true)
    }
}
