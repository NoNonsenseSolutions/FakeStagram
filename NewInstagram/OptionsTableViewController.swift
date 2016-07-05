//
//  OptionsTableViewController.swift
//  NewInstagram
//
//  Created by Wong You Jing on 04/07/2016.
//  Copyright © 2016 Nononsense. All rights reserved.
//

import UIKit

class OptionsTableViewController: UITableViewController {

  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    if indexPath.section == 1 && indexPath.row == 0 {
      User.logoutUser()
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let vc = storyboard.instantiateViewControllerWithIdentifier("FirstNavController")
      self.view.window?.rootViewController = vc
    }
  }
}
