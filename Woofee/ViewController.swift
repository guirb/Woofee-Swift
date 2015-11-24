//
//  ViewController.swift
//  Woofee
//
//  Created by Student on 19/11/15.
//  Copyright © 2015 OsCatchoro Inc. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if(FBSDKAccessToken.currentAccessToken() == nil){
            print("Not logged in...")
        }
        else{
            print("Logged")
        }
        
        let logginButton = FBSDKLoginButton()
        logginButton.readPermissions = ["public_profile", "email", "user_friends"]
        logginButton.center = self.view.center
        
        logginButton.delegate = self
        
        self.view.addSubview(logginButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK - Facebook Login
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        if(error == nil){
            print("Login complete")
            self.performSegueWithIdentifier("showNew", sender: self)
        }
        else {
            print(error.localizedDescription)
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("user logged out")
    }

}

