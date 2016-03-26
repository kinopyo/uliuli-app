//
//  User.swift
//  uliuli-app
//
//  Created by qihuan-piao on 2016/03/26.
//  Copyright © 2016年 qihuan-piao. All rights reserved.
//

import SwiftyJSON

class User {
  var pictureURL: String!
  var username: String!

  required init(json: JSON) {
    pictureURL = json["picture"]["medium"].stringValue
    username = json["username"].stringValue
  }
}