//
//  FirstViewController.swift
//  uliuli-app
//
//  Created by qihuan-piao on 2016/03/26.
//  Copyright © 2016年 qihuan-piao. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
  func getPosts() {
    ApiClient.sharedInstance.getPosts { (posts) in
      for post in posts! {
        print("post body: \(post.body)")
      }
    }
  }
}