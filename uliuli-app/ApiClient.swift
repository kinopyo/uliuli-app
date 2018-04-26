//
//  ApiClient.swift
//  uliuli-app
//
//  Created by qihuan-piao on 2016/03/26.
//  Copyright © 2016年 qihuan-piao. All rights reserved.
//

import Alamofire
import SwiftyJSON
import ObjectMapper

typealias UserResponse = (User?) -> Void

class ApiClient: NSObject {
  static let sharedInstance = ApiClient()

//  let baseURL = "http://localhost:3002/api/v1/posts"
  let baseURL = "http://uliuli.kinopyo.com/api/v1/posts"

  func getPosts(_ onComplete: @escaping ([Post]?) -> Void) {
    Alamofire.request(.GET, baseURL).responseJSON { response in
      guard response.result.isSuccess else {
        print("Error while fetching posts: \(response.result.error)")
        onComplete(nil)
        return
      }

      if let data = response.result.value {
        let postsJson = JSON(data)["posts"]
        var ret = [Post]()

        for postJson in postsJson.arrayValue {
          if let post = Mapper<Post>().map(postJson.rawValue) {
            ret.append(post)
          }
        }
        onComplete(ret)
      }
    }
  }

  func getRandomUser(_ onCompletion: @escaping UserResponse) {
    let endpoint = "http://api.randomuser.me/"
    Alamofire.request(.GET, endpoint)
      .responseJSON { response in
        guard response.result.isSuccess else {
          print("Error while fetching user: \(response.result.error)")
          onCompletion(nil)
          return
        }

        if let data = response.result.value {
          let userArray = JSON(data)
          let user = User(json: userArray["results"][0]["user"])
          onCompletion(user)
        }
    }
  }
}
