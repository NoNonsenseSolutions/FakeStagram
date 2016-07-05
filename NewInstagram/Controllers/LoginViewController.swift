//
//  LoginViewController.swift
//  NewInstagram
//
//  Created by Wong You Jing on 01/07/2016.
//  Copyright © 2016 Nononsense. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
  
  
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(true)
    UIApplication.sharedApplication().statusBarHidden = true
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(true)
    UIApplication.sharedApplication().statusBarHidden = false
  }
  
  @IBAction func onLoginButtonPressed(sender: UIButton) {
    guard let email = emailTextField.text, let password = passwordTextField.text else{
      return
    }
    
    FIRAuth.auth()?.signInWithEmail(email, password: password) { (user, error) in
      if let user = user{
        User.saveToUserDefaults(user.uid)
        self.performSegueWithIdentifier("HomeSegue", sender: nil)
      }else{
        print(error?.localizedDescription)
      }
    }
  }
  
  @IBAction func backToLogin(sender: UIStoryboardSegue) {
  }
  
  @IBAction func onViewTapped(sender: UITapGestureRecognizer) {
    self.emailTextField.resignFirstResponder()
    self.passwordTextField.resignFirstResponder()
  }
  
}
