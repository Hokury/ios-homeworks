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

        self.view.backgroundColor = UIColor.lightGray
        self.view.addSubview(headerView)

    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let headerViewHeight: CGFloat = 220.0
        let headerViewFrame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: headerViewHeight)
        headerView.frame = view.frame
    }
}
