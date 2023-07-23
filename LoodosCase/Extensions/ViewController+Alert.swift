//
//  ViewController+Alert.swift
//  LoodosCase
//
//  Created by Yalçın Golayoğlu on 22.07.2023.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String?, message: String?, actionTitle: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: UIAlertAction.Style.default, handler: { UIAlertAction in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
