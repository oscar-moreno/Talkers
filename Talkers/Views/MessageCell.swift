//
//  MessageCell.swift
//  Talkers
//
//  Created by Óscar on 16/7/22.
//  Copyright © 2022 Oscar Moreno. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

  @IBOutlet weak var messageView: UIView!
  @IBOutlet weak var messageLabel: UILabel!
  @IBOutlet weak var meAvatar: UIImageView!
  @IBOutlet weak var youAvatar: UIImageView!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    messageView.layer.cornerRadius = messageView.frame.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
