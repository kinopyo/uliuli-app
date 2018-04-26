//
//  RootViewController.swift
//  uliuli-app
//
//  Created by qihuan-piao on 2016/03/26.
//  Copyright © 2016年 qihuan-piao. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    let defaults = UserDefaults.standard
    if let user = defaults.object(forKey: "currentUser") {
      print("saved value are: \(user)")
      // TODO: investigate why this won't work if it's inside viewDidLoad() method
      performSegue(withIdentifier: "Logged In", sender: self)
    }
  }

  @IBAction func login(_ sender: UIButton) {
    if let user = sender.titleLabel!.text {
      switch user {
      case "Q":
        performSegue(withIdentifier: "Logged In", sender: sender)
        let defaults = UserDefaults.standard
        defaults.set("Q", forKey: "currentUser")
      default: print("Must login first")
      }
    }
  }
}
