//
//  SceneDelegate.swift
//  LoodosCase
//
//  Created by Yalçın Golayoğlu on 18.07.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        let vc = ViewController()
        let navigationView = UINavigationController(rootViewController: vc)
        window.rootViewController = navigationView
        window.makeKeyAndVisible()
    }
}

