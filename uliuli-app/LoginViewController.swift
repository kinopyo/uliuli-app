//
//  RootViewController.swift
//  uliuli-app
//
//  Created by qihuan-piao on 2016/03/26.
//  Copyright © 2016年 qihuan-piao. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)

    let defaults = NSUserDefaults.standardUserDefaults()
    if let user = defaults.objectForKey("currentUser") {
      print("saved value are: \(user)")
      // TODO: investigate why this won't work if it's inside viewDidLoad() method
      performSegueWithIdentifier("Logged In", sender: self)
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