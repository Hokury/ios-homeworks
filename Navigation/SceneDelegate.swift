//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Anastasia Sokolova on 26.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        let feedViewController = FeedViewController()
        let profileViewController = ProfileViewController()
        let postViewController = PostViewController()

        let feedNavigationController = UINavigationController(rootViewController: feedViewController)
        feedNavigationController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))

        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))

//        let postNavigationController = UINavigationController(rootViewController: postViewController)
//        postNavigationController.tabBarItem = UITabBarItem(title: "Пост", image: UIImage(systemName: "message.fill"), selectedImage: UIImage(systemName: "message.fill"))

        let myPost = Post(title: "Новый пост")
        postViewController.post = myPost

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [feedNavigationController, profileNavigationController]
        tabBarController.tabBar.backgroundColor = UIColor.white

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = tabBarController
        self.window = window
        window.makeKeyAndVisible()
    }
}
