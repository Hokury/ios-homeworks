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
        let postViewController = PostViewController()
        let logInViewController = LogInViewController()

        let feedNavigationController = UINavigationController(rootViewController: feedViewController)
        feedNavigationController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        let logInNavigationController = UINavigationController(rootViewController: logInViewController)
        logInNavigationController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))

        let myPost = Post(title: "Мой новый пост")
        postViewController.post = myPost

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [feedNavigationController, logInNavigationController]
        tabBarController.tabBar.backgroundColor = UIColor.white

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = tabBarController
        self.window = window
        window.makeKeyAndVisible()
    }
}
