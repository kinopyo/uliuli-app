//
//  FirstViewController.swift
//  uliuli-app
//
//  Created by qihuan-piao on 2016/03/26.
//  Copyright © 2016年 qihuan-piao. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var tableView: UITableView!
  var items = [Post]()

  override func viewDidLoad() {
    super.viewDidLoad()
    getPosts()
  }

  func getPosts() {
    ApiClient.sharedInstance.getPosts { (posts) in
      for post in posts! {
        self.items.append(post)
        print("post body: \(post.body)")
      }

      dispatch_async(dispatch_get_main_queue(),{
        self.tableView.reloadData()
      })
    }
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.items.count;
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! photoCell

    let post = self.items[indexPath.row]
    cell.content.text = post.body
    cell.userName.text = post.userName

    if let url = NSURL(string: post.imageUrl) {
      if let data = NSData(contentsOfURL: url) {
        cell.photo.image = UIImage(data: data)
      }
    }

    return cell
  }
}