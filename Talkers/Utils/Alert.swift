//
//  DisplayAlert.swift
//  Talkers
//
//  Created by Óscar on 15/7/22.
//  Copyright © 2022 Oscar Moreno. All rights reserved.
//

import UIKit

struct Alert {
  static func displayAlert(viewController: UIViewController, title: String, message: String) {
    let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .default)
    dialogMessage.addAction(ok)
    viewController.present(dialogMessage, animated: true, completion: nil)
  }
}
