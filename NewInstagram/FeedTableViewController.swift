//
//  FeedTableViewController.swift
//  NewInstagram
//
//  Created by Wong You Jing on 04/07/2016.
//  Copyright © 2016 Nononsense. All rights reserved.
//

import UIKit
import FirebaseStorage
import SDWebImage

class FeedTableViewController: UITableViewController {
  var images = [String]()
  
  
  override func viewDidLoad() {
    tableView.estimatedRowHeight = tableView.rowHeight
    tableView.rowHeight = UITableViewAutomaticDimension
    
    DataService.dataService.currentUserRef.child("images").observeEventType(.ChildAdded, withBlock: { snapshot in
      DataService.dataService.imagesRef.child(snapshot.key).observeSingleEventOfType(.Value, withBlock: { snapshot in
        if let imageDict = snapshot.value as? [String: AnyObject]{
          if let imageURL = imageDict["downloadURL"] as? String {
            self.images.insert(imageURL, atIndex: 0)
            self.tableView.reloadData()
          }
        }
      })
    })
  }
  // MARK: - Table view data source
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return images.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCellWithIdentifier("PhotoCell") as? ImageTableViewCell{
      let imageURL = images[indexPath.row]
      cell.photoImageView.sd_setImageWithURL(NSURL(string: imageURL), placeholderImage: UIImage(named: "loading"))
      
      return cell
    }else{
      return UITableViewCell()
    }
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let destination = segue.destinationViewController
    destination.hidesBottomBarWhenPushed = true
  }
  
}
