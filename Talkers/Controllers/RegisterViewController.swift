//
//  RegisterViewController.swift
//  Talkers
//
//  Created by Óscar on 11/7/22.
//  Copyright © 2022 Oscar Moreno. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
  
  @IBOutlet weak var emailTextfield: UITextField!
  @IBOutlet weak var passwordTextfield: UITextField!
  
  @IBAction func registerPressed(_ sender: UIButton) {
    guard let userEmail = emailTextfield.text else {
      print("ERROR: Error unwrapping email")
      return
    }
    guard let userPassword = passwordTextfield.text else {
      print("ERROR: Error unwrapping password")
      return
    }
    Auth.auth().createUser(withEmail: userEmail, password: userPassword) { authResult, error in
      if let errorCreatingUser = error {
        print("ERROR: Error creating user -> \(errorCreatingUser.localizedDescription)")
        Alert.displayAlert(viewController: self, title: "Error", message: errorCreatingUser.localizedDescription)
      } else {
        self.performSegue(withIdentifier: Constants.Segues.registerToChat , sender: self)
      }
      
    }
  }
  
}
