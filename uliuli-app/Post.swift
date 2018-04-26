//
//  Post.swift
//  uliuli-app
//
//  Created by qihuan-piao on 2016/03/26.
//  Copyright © 2016年 qihuan-piao. All rights reserved.
//

import SwiftyJSON
import ObjectMapper

class Post: Mappable {
  var body: String?
  var imageUrl: String?
  var userName: String?

  required init?(_ map: Map) {

  }

  // Mappable
  func mapping(_ map: Map) {
    body     <- map["body"]
    imageUrl <- map["image_url"]
    userName <- map["user.name"]
  }
}
