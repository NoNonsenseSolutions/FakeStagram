//
//  User.swift
//  NewInstagram
//
//  Created by Wong You Jing on 01/07/2016.
//  Copyright © 2016 Nononsense. All rights reserved.
//

import Foundation
import FirebaseAuth

class User: NSObject{
  static func saveToUserDefaults(uid: String){
    NSUserDefaults.standardUserDefaults().setValue(uid, forKey: "uid")
  }
  
  static func currentUserUid() -> String?{
    return NSUserDefaults.standardUserDefaults().valueForKey("uid") as? String
  }
  
  static func logoutUser(){
    do{
      try FIRAuth.auth()?.signOut()
      NSUserDefaults.standardUserDefaults().removeObjectForKey("uid")
    }catch let error as NSError{
      print(error.localizedDescription)
    }
  }
}