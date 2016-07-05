//
//  StorageService.swift
//  NewInstagram
//
//  Created by Wong You Jing on 05/07/2016.
//  Copyright © 2016 Nononsense. All rights reserved.
//

import Foundation
import FirebaseStorage

class StorageService {
  static let storageService = StorageService()
  
  var storage = FIRStorage.storage()
  
  
  private var _rootRef = FIRStorage.storage().referenceForURL("gs://newinstagram-65cb4.appspot.com")
  
  var rootRef: FIRStorageReference {
    return _rootRef
  }
}