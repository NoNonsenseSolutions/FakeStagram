//
//  ViewController.swift
//  NewInstagram
//
//  Created by Wong You Jing on 30/06/2016.
//  Copyright © 2016 Nononsense. All rights reserved.
//

import UIKit
import Fusuma
import FirebaseAuth
import FirebaseStorage
import SDWebImage
class CameraViewController: UIViewController{
  
  var initialLoad = true
  
  override func viewDidAppear(animated: Bool) {
    if initialLoad{
      initialLoad = false
      let fusuma = FusumaViewController()
      fusuma.delegate = self
      fusuma.hasVideo = true // If you want to let the users allow to use video.
      self.presentViewController(fusuma, animated: true, completion: nil)
    }
  }
}

extension CameraViewController: FusumaDelegate{
  func fusumaImageSelected(image: UIImage){
    
    self.initialLoad = true
    self.tabBarController?.selectedIndex = 0
    FIRAuth.auth()?.addAuthStateDidChangeListener({ (auth, user) in
      if let user = user{
        let metadata = FIRStorageMetadata()
        metadata.contentType = "image/jpeg"
        
        if let imageData = UIImageJPEGRepresentation(image, 0.01){
          StorageService.storageService.rootRef.child(user.uid).child(NSUUID().UUIDString).putData(imageData, metadata: metadata, completion: { (metadata, error) in
            if (error != nil) {
              // Uh-oh, an error occurred!
            } else {
              if let downloadURL = metadata!.downloadURL()?.absoluteString{
                let imagesDict = ["downloadURL": downloadURL]
                let newImageRef = DataService.dataService.imagesRef.childByAutoId()
                newImageRef.setValue(imagesDict)
                DataService.dataService.currentUserRef.child("images").child(newImageRef.key).setValue(true)
                SDImageCache.sharedImageCache().storeImage(image, forKey: downloadURL)
              }
            }
          })
        }
      }
    })
    
  }
  func fusumaVideoCompleted(withFileURL fileURL: NSURL){
    
  }
  func fusumaCameraRollUnauthorized(){
    
  }
}