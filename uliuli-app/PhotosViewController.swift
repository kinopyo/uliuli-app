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

      DispatchQueue.main.async(execute: {
        self.tableView.reloadData()
      })
    }
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.items.count;
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! photoCell

    let post = self.items[(indexPath as NSIndexPath).row]
    cell.content.text = post.body
    cell.userName.text = post.userName

    if let url = URL(string: post.imageUrl!) {
      if let data = try? Data(contentsOf: url) {
        cell.photo.image = UIImage(data: data)
      }
    }

    return cell
  }
}
