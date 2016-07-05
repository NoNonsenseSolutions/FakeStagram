//
//  DataService.swift
//  NewInstagram
//
//  Created by Wong You Jing on 30/06/2016.
//  Copyright © 2016 Nononsense. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DataService{
  static let dataService = DataService()
  // Added comment for github demo
  // My hand is too itchy, i should never edit code here I am gonna try to make a conflict
  private var _rootRef = FIRDatabase.database().reference()
  private var _currentUserRef = FIRDatabase.database().reference().child("users").child(User.currentUserUid()!)
  private var _imagesRef = FIRDatabase.database().reference().child("images")
  
  
  
  var rootRef: FIRDatabaseReference{
    return _rootRef
  }
  
  var currentUserRef: FIRDatabaseReference{
    return _currentUserRef
  }
  
  var imagesRef: FIRDatabaseReference{
    return _imagesRef
  }
  
}

