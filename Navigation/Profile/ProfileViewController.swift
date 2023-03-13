//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Anastasia Sokolova on 26.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    let headerView = ProfileHeaderView()

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
    }
}
