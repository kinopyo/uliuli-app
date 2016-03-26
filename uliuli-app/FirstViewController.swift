//
//  FirstViewController.swift
//  uliuli-app
//
//  Created by qihuan-piao on 2016/03/26.
//  Copyright © 2016年 qihuan-piao. All rights reserved.
//

import UIKit
import SwiftyJSON

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  var tableView: UITableView!
  var items = [User]()

  override func viewWillAppear(animated: Bool) {
    let frame:CGRect = CGRect(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height - 100)
    self.tableView = UITableView(frame: frame)
    self.tableView.dataSource = self
    self.tableView.delegate = self
    self.view.addSubview(self.tableView)

    let btn = UIButton(frame: CGRect(x: 0, y: 25, width: self.view.frame.width, height: 50))
    btn.backgroundColor = UIColor.cyanColor()
    btn.setTitle("Add new Dummy", forState: UIControlState.Normal)
    btn.addTarget(self, action: "getPosts", forControlEvents: UIControlEvents.TouchUpInside)
    self.view.addSubview(btn)
  }

  func getPosts() {
    ApiClient.sharedInstance.getPosts { (posts) in
      for post in posts! {
        print("post body: \(post.body)")
      }
    }
  }

  func addDummyData() {
    ApiClient.sharedInstance.getRandomUser { (user: User?) in
      if (user != nil) {
        self.items.append(user!)

        dispatch_async(dispatch_get_main_queue(),{
          self.tableView.reloadData()
        })
      }
    }
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.items.count;
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier("CELL")

    if cell == nil {
      cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "CELL")
    }

    let user = self.items[indexPath.row]

    if let url = NSURL(string: user.pictureURL) {
      if let data = NSData(contentsOfURL: url) {
        cell?.imageView?.image = UIImage(data: data)
      }
    }
    cell!.textLabel?.text = user.username
    return cell!
  }
}