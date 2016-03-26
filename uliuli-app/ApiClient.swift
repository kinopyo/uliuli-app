//
//  ApiClient.swift
//  uliuli-app
//
//  Created by qihuan-piao on 2016/03/26.
//  Copyright © 2016年 qihuan-piao. All rights reserved.
//

import Alamofire
import SwiftyJSON

typealias UserResponse = (User?) -> Void

class ApiClient: NSObject {
  static let sharedInstance = ApiClient()

  let baseURL = "http://api.randomuser.me/"

  func getRandomUser(onCompletion: UserResponse) {
    Alamofire.request(.GET, baseURL)
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