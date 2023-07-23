//
//  AppDelegate.swift
//  LoodosCase
//
//  Created by Yalçın Golayoğlu on 18.07.2023.
//

import UIKit
import CoreData
import Firebase
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NetworkManager.shared.startMonitoring()
        FirebaseApp.configure()
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }
}

