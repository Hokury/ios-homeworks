//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Anastasia Sokolova on 26.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    let headerView = ProfileHeaderView()
    let newButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(headerView)
        self.view.backgroundColor = UIColor.lightGray

        headerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 220)
        ])

        headerView.addSubview(newButton)

        newButton.addTarget(self, action: #selector(profileViewControllerNewButtonPressed(_:)), for: .touchUpInside)

        headerView.addConstraints( [
            newButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            newButton.rightAnchor.constraint(equalTo: headerView.rightAnchor),
            newButton.heightAnchor.constraint(equalTo: headerView.heightAnchor)
        ])
    }

    @objc func profileViewControllerNewButtonPressed(_ sender: UIButton) {
        print("Profile View New Button Pressed!")
    }
}
