//
//  Constants.swift
//  Talkers
//
//  Created by Óscar on 16/7/22.
//  Copyright © 2022 Oscar Moreno. All rights reserved.
//

import Foundation

struct Constants {
  
  static let appName = "Talkers"
  
  struct BrandColors {
      static let purple = "BrandPurple"
      static let lightPurple = "BrandLightPurple"
      static let blue = "BrandBlue"
      static let lighBlue = "BrandLightBlue"
  }
  
  struct Cells {
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
  }
  
  struct FStore {
      static let collectionName = "messages"
      static let senderField = "sender"
      static let bodyField = "body"
      static let dateField = "date"
  }
  
  struct Segues {
    static let registerToChat = "RegisterToChat"
    static let loginToChat = "LoginToChat"
  }
  
}


