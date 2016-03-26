//
//  RootViewController.swift
//  uliuli-app
//
//  Created by qihuan-piao on 2016/03/26.
//  Copyright © 2016年 qihuan-piao. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let defaults = NSUserDefaults.standardUserDefaults()
    if (defaults.objectForKey("currentUser") != nil) {
      performSegueWithIdentifier("Logged In", sender: nil)
    }
  }

  @IBAction func login(sender: UIButton) {
    if let user = sender.titleLabel!.text {
      switch user {
      case "Q":
        performSegueWithIdentifier("Logged In", sender: sender)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("Q", forKey: "currentUser")
      default: print("Must login first")
      }
    }
  }
}