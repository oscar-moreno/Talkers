//
//  ChatViewController.swift
//  Talkers
//
//  Created by Óscar on 11/7/22.
//  Copyright © 2022 Oscar Moreno. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var messageTextfield: UITextField!
  
  let db = Firestore.firestore()
  
  var messages = [Message]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = Constants.appName
    navigationItem.hidesBackButton = true
    tableView.dataSource = self
    tableView.register(UINib(nibName: Constants.Cells.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.Cells.cellIdentifier)
    loadMessages()
  }
  
  func loadMessages() {
    db.collection(Constants.FStore.collectionName).order(by: Constants.FStore.dateField).addSnapshotListener { querySnapshot, error in
      self.messages = []
      if let e = error {
        print("ERROR -> Error getting messages: \(e.localizedDescription)")
      } else {
        for document in querySnapshot!.documents {
          guard let sender = document.data()[Constants.FStore.senderField] as? String else {return}
          guard let body = document.data()["body"] as? String else {return}
          let newMessage = Message(sender: sender, body: body)
          self.messages.append(newMessage)
          DispatchQueue.main.async {
            self.tableView.reloadData()
            let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
          }
        }
      }
    }
  }
  
  func displayMyMessage(cell: MessageCell) {
    cell.youAvatar.isHidden = true
    cell.meAvatar.isHidden = false
    cell.messageView.backgroundColor = UIColor(named: Constants.BrandColors.lightPurple)
    cell.messageLabel.textColor = UIColor(named: Constants.BrandColors.purple)
  }
  
  func displayNotMyMessage(cell: MessageCell) {
    cell.meAvatar.isHidden = true
    cell.youAvatar.isHidden = false
    cell.messageView.backgroundColor = UIColor(named: Constants.BrandColors.purple)
    cell.messageLabel.textColor = UIColor(named: Constants.BrandColors.lightPurple)
  }
  
  @IBAction func sendPressed(_ sender: UIButton) {
    if messageTextfield.text == "" {
      return
    }
    if let sender = Auth.auth().currentUser?.email, let message = messageTextfield.text {
      db.collection(Constants.FStore.collectionName).addDocument(data: [
        Constants.FStore.senderField:sender,
        Constants.FStore.bodyField:message,
        Constants.FStore.dateField:Date().timeIntervalSince1970
      ]) { (error) in
        if let e = error {
          print("ERROR -> Error saving message: \(e.localizedDescription)")
        } else {
          print("Message saved succesfuly")
          self.messageTextfield.text = ""
        }
      }
    }
  }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
      let firebaseAuth = Auth.auth()
      do {
        try firebaseAuth.signOut()
        navigationController?.popToRootViewController(animated: true)
      } catch let signOutError as NSError {
        print("Error signing out: %@", signOutError)
      }
    }
    
  }
  
  //MARK: - UITableViewDatasource
  
  extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let message = messages[indexPath.row]
      let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.cellIdentifier) as! MessageCell
      cell.messageLabel.text = message.body
      
      if message.sender == Auth.auth().currentUser?.email {
        displayMyMessage(cell: cell)
      } else {
        displayNotMyMessage(cell: cell)
      }
      
      return cell
    }
  }
  
  
