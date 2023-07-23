//
//  ViewController.swift
//  LoodosCase
//
//  Created by Yalçın Golayoğlu on 21.07.2023.
//

import UIKit
import FirebaseRemoteConfig
import Cartography

class ViewController: UIViewController {
    
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    var splash: String? {
        get {
            return splashLabel.text
        }
        set {
            splashLabel.text = newValue
        }
    }
    
    private let splashLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.font = Style.SplashViewController.splashTitleFont
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if NetworkManager.shared.isConnected {
            fetchValues()
            Timer.scheduledTimer(timeInterval: Constants.SplashViewController.splashTime, target: self, selector: #selector(self.splashTimeOut(sender:)), userInfo: nil, repeats: false)
            
        } else {
            showAlert(
                title: Constants.SplashViewController.alertTitle,
                message: Constants.SplashViewController.alertMessage,
                actionTitle: Constants.SplashViewController.alertActionTitle
            )
        }
        
        view.addSubview(splashLabel)
        
        constrain(splashLabel) {
            guard let superview = $0.superview else { return }
            $0.center == superview.center
        }
        
    }
    
    @objc func splashTimeOut(sender : Timer) {
        let homePageViewController = HomePageViewController()
        self.navigationController?.pushViewController(homePageViewController, animated: false)
    }
    
    func fetchValues() {
        let defaults: [String: NSObject] = [
            Constants.SplashViewController.remoteConfigTitle: "" as NSObject,
            Constants.SplashViewController.remoteConfigApiKey: "" as NSObject
        ]
        
        remoteConfig.setDefaults(defaults)
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        
        self.remoteConfig.fetch(withExpirationDuration: 0) { status, error in
            if status == .success, error == nil {
                self.remoteConfig.activate { bool, error in
                    guard error == nil else {
                        return
                    }
                    
                    let splashTitle = self.remoteConfig.configValue(
                        forKey: Constants.SplashViewController.remoteConfigTitle
                    ).stringValue
                    let apiKeyValue = self.remoteConfig.configValue(
                        forKey: Constants.SplashViewController.remoteConfigApiKey
                    ).stringValue
                    
                    DispatchQueue.main.async {
                        self.splash = splashTitle
                        apiKey = apiKeyValue ?? ""
                    }
                }
            } else {
                return
            }
        }
    }
    
}
