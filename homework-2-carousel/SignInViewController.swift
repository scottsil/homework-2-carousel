//
//  SignInViewController.swift
//  homework-2-carousel
//
//  Created by Scott Silverman on 2/15/15.
//  Copyright (c) 2015 Scott Silverman. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var signInScrollView: UIScrollView!
    @IBOutlet weak var signInButtonScrollView: UIScrollView!
    var keyboardIsShowing: Bool! = false
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    @IBAction func backButtonDidPress(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }

    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        if(keyboardIsShowing == false) {
            self.signInScrollView.center.y = signInScrollView.center.y - 110
            self.signInButtonScrollView.center.y = 568 - self.signInButtonScrollView.frame.height/2 - kbSize.height
            keyboardIsShowing = true
        }
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        self.signInScrollView.center.y = signInScrollView.center.y + 110
        self.signInButtonScrollView.center.y = self.signInButtonScrollView.center.y + kbSize.height
        keyboardIsShowing = false
    }
    
    @IBAction func signInButtonDidPress(sender: AnyObject) {
        if(emailTextField.text == "" || passwordTextField.text == "") {
            var alertView = UIAlertView(title: "Email Required", message: "Please enter your email and password to sign in.", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        } else {
            var alertView = UIAlertView(title: "Signing In...", message: "", delegate: self, cancelButtonTitle: nil)
            alertView.show()
            delay(2){
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                if(self.emailTextField.text == "scottsil@mac.com" && self.passwordTextField.text == "qwerty"){
                    self.performSegueWithIdentifier("welcomeTutorialSegue", sender: self)
                } else {
                    var alertView = UIAlertView(title: "Sign In Failed", message: "Please check your email and password.", delegate: self, cancelButtonTitle: "OK")
                    alertView.show()
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
