//
//  LoginViewController.swift
//  Talkers
//
//  Created by Óscar on 11/7/22.
//  Copyright © 2022 Oscar Moreno. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
  
  @IBOutlet weak var emailTextfield: UITextField!
  @IBOutlet weak var passwordTextfield: UITextField!
  
  @IBAction func loginPressed(_ sender: UIButton) {
    guard let userEmail = emailTextfield.text else {
      print("ERROR: Error unwrapping email")
      return
    }
    guard let userPassword = passwordTextfield.text else {
      print("ERROR: Error unwrapping password")
      return
    }
    Auth.auth().signIn(withEmail: userEmail, password: userPassword) { authResult, error in
      if let errorLoginUser = error {
        print("ERROR: Error login user -> \(errorLoginUser.localizedDescription)")
        Alert.displayAlert(viewController: self, title: "Error", message: errorLoginUser.localizedDescription)
      } else {
        self.performSegue(withIdentifier: Constants.Segues.loginToChat, sender: self)
      }
    }
  }
  
}
