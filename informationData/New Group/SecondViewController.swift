//
//  SecondViewController.swift
//  informationData
//
//  Created by Jeni kakadiya on 6/24/21.
//  Copyright © 2021 Jeni kakadiya. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    //person info
    let gblClass = information()
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtColor: UITextField!
    let colours = ["Red","Green","Black","White","Pink","Yellow","Gray","Orange","Purple"]
    var pickerView = UIPickerView()
    
    //account info
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!

    //contact info
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    
    @IBOutlet weak var txtPhoneNo: UITextField!
    
    
    //@IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var buttonDone: UIButton!
    @IBOutlet weak var buttonSubmit: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtFullName.delegate = self
        txtColor.delegate = self
        txtEmail.delegate = self
        txtPassword.delegate = self
        txtAddress.delegate = self
        txtCountry.delegate = self
        txtPhoneNo.delegate = self
        
        pickerView.delegate = self
        pickerView.dataSource = self
        txtColor.inputView = pickerView
        txtColor.textAlignment = .left
       
        
        self.hideKeyboardTappedAround()
        buttonSave = gblClass.makeButton(title: "Save", button: buttonSave, titleColor: .black, background: .separator, font: UIFont.init(name:"Arial", size: 25.0), cornerRadius: 5.0)
        buttonDone = gblClass.makeButton(title: "Done", button: buttonDone, titleColor: .black, background: .separator, font: UIFont.init(name: "Arial", size: 25.0), cornerRadius: 5.0)
        buttonSubmit = gblClass.makeButton(title: "Submit", button: buttonSubmit, titleColor: .black, background: .separator, font: UIFont.init(name: "Arial", size: 25.0), cornerRadius: 5.0)
    
         print(gblClass.testString(title: "pass test String"))
        
        txtFullName = gblClass.createTextField(placeholder: "Enter Full Name", myTextField: txtFullName, background: .white, fontColor: .black, cornerRadius: 6.0)
        txtColor = gblClass.createTextField(placeholder: " ", myTextField: txtColor, background: .white, fontColor: .black, cornerRadius: 6.0)
        txtEmail = gblClass.createTextField(placeholder: " ", myTextField: txtEmail, background: .white, fontColor: .black, cornerRadius: 6.0)
        txtPassword = gblClass.createTextField(placeholder: " ", myTextField: txtPassword, background: .white, fontColor: .black, cornerRadius: 6.0)
        txtAddress = gblClass.createTextField(placeholder: " ", myTextField: txtAddress, background: .white, fontColor: .black, cornerRadius: 6.0)
        txtCountry = gblClass.createTextField(placeholder: " ", myTextField: txtCountry, background: .white, fontColor: .black, cornerRadius: 6.0)
        txtPhoneNo = gblClass.createTextField(placeholder: " ", myTextField: txtPhoneNo, background: .white, fontColor: .black, cornerRadius: 6.0)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
   //person info
    @IBAction func btnSaveClick(_ sender: UIButton) {
      
    }
    
    //account info
    @IBAction func btnDoneClick(_ sender: UIButton) {
        if (txtEmail.text?.isValidEmail)!{
        print("your email is valid")
        } else {
        print("your email is not valid")
        }
        
        if (txtPassword.text?.isPasswordValid)! {
            print("password is valid")
        } else {
        print("password is not valid")
        }
    }
    
    //contact info
    @IBAction func btnSubmit(_ sender: UIButton) {
        if (txtPhoneNo.text?.isPhoneNumber)! {
          print("number is valid")
        } else {
         print("number is not valid")
        }
    }
    

}


extension String {
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count && self.count == 10
            } else {
                return false
            }
        } catch {
          return false
        }
    }
    var isPasswordValid: Bool{
      let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: self)
    }
    
    var isValidEmail: Bool{
    let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3}"
    let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }

    
}

extension SecondViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colours.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colours[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtColor.text = colours[row]
        txtColor.resignFirstResponder()
    }
    
  
    
    func hideKeyboardTappedAround(){
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard ))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    
}










/*
    @IBAction func btnDoneClick(_ sender: Any) {
    
   let EmailAddress = txtEmail.text

    let ValidEmailAddress = isValidEmailAddress(emailAddressString: EmailAddress!)
           
           if ValidEmailAddress
           {
               print("Email address is valid")
           } else {
               print("Email address is not valid")
               displayAlertMessage(messageToDisplay: "Email address is not valid")
           }
           
       }
    func isValidEmailAddress(emailAddressString: String) -> Bool {
            var returnValue = true
            let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3}"
            
            do {
                let regex = try NSRegularExpression(pattern: emailRegEx)
                let nsString = emailAddressString as NSString
                let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
                
                if results.count == 0
                {
                    returnValue = false
                }
                
            } catch let error as NSError {
                print("invalid regex: \(error.localizedDescription)")
                returnValue = false
            }
            
            return  returnValue
        }
        
        func displayAlertMessage(messageToDisplay: String)
        {
            let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                
                // Code in this block will trigger when OK button tapped.
                print("Ok button tapped");
                
            }
            
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true, completion:nil)
        }

    
}
}
}
/*
extension SecondViewController{
    func validateEmailId() -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return applyPredicateOnRegex(regexStr: emailRegEx)
}

    func validatePassword(mini: Int = 8, max: Int = 8) -> Bool {
        var passRegEx = ""
        if mini >= max{
             passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(mini),}$"
        } else {
            passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(mini),\(max)}$"
        }
        return applyPredicateOnRegex(regexStr: passRegEx)
        
    }
    func applyPredicateOnRegex(regexStr: String) -> Bool{
      
}
}
*/
*/
