//
//  Model.swift
//  Navigation
//
//  Created by Anastasia Sokolova on 26.02.2023.
//

import Foundation

struct Post {
    var title: String
}

func main() {

    let myPost = Post(title: "Мой новый пост")

    let postViewController = PostViewController()

    postViewController.post = myPost
}
