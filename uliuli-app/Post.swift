//
//  Post.swift
//  uliuli-app
//
//  Created by qihuan-piao on 2016/03/26.
//  Copyright © 2016年 qihuan-piao. All rights reserved.
//

import SwiftyJSON

class Post {
  var body: String!
  var imageUrl: String!
  var userName: String!

  required init(json: JSON) {
    body = json["body"].stringValue
    imageUrl = json["image"].stringValue
    userName = json["user"]["name"].stringValue
  }
}