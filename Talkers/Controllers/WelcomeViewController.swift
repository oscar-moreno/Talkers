//
//  WelcomeViewController.swift
//  Talkers
//
//  Created by Óscar on 11/7/22.
//  Copyright © 2022 Oscar Moreno. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    animateTitleDisplay()
  }
  
  func animateTitleDisplay(){
    titleLabel.text = ""
    let title = "Talkers"
    var index = 0
    for char in title {
      Timer.scheduledTimer(withTimeInterval: 0.2 * Double(index), repeats: false) { (timer) in
        self.titleLabel.text?.append(char)
      }
      index+=1
    }
  }
  
}
