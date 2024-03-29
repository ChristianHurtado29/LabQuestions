//
//  UIViewController+Alerts.swift
//  LabQuestions
//
//  Created by Alex Paul on 12/12/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

extension UIViewController {
    //alert message when something goes wrong on app
  func showAlert(title: String, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
  }
}
