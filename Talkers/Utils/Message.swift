//
//  Message.swift
//  Talkers
//
//  Created by Óscar on 16/7/22.
//  Copyright © 2022 Oscar Moreno. All rights reserved.
//

import Foundation

struct Message {
  let sender: String
  let body: String
  
  init (sender: String, body: String) {
    self.sender = sender
    self.body = body
  }
  
}
