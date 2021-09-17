//
//  SignupViewController.swift
//  informationData
//
//  Created by Jeni kakadiya on 6/30/21.
//  Copyright © 2021 Jeni kakadiya. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textfieldUserName: UITextField!
    @IBOutlet weak var textfieldPassword: UITextField!
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var SignUp: UIButton!
    @IBOutlet weak var GoogleSignUp: UIButton!
    @IBOutlet weak var CreateAccount: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //create Account Button
        CreateAccount.addTarget(self, action: #selector(tapOnButtonForNavigation), for: .touchUpInside)
       // GoogleSignUp.addTarget(self, action: Selector(("didTapGoogle")), for: .touchUpInside)
    }

     //create Account Button
    @objc func tapOnButtonForNavigation(){
         let story = UIStoryboard(name: "Main", bundle: nil)
         let controller = story.instantiateViewController(identifier: "CreateAccountViewController") as! CreateAccountViewController
         let navigation = UINavigationController(rootViewController: controller)
         self.view.addSubview(navigation.view)
         self.addChild(navigation)
         navigation.didMove(toParent: self)
        textfieldUserName.delegate = self
        textfieldPassword.delegate = self
    }

    @IBAction func clickSignup(_ sender: UIButton) {
    if (textfieldPassword.text?.isPasswordValid)! {
               print("password is valid")
           } else {
           print("password is not valid")
        }
    }

    @IBAction func googleAccount(_ sender: UIButton) {
      //  UIApplication.sherdApplication() as AnyObject).openURL(NSURL(string: "http://www.google.com")!
        
    
     /*     let chromeURL = "googlechrome://"
        UIApplication.shared.openURL(URL(string: chromeURL)!)

        let chromeURL = "googlechrome://http://api.sharjbook.com/api/Order/CreatePaymentOrder"
        UIApplication.shared.openURL(URL(string: chromeURL)!)
    }
    */
}
}
extension SignupViewController {
    var isPasswordValid: Bool{
         let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
           return passwordTest.evaluate(with: self)
       }
        
}

