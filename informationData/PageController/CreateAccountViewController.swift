//
//  CreateAccountViewController.swift
//  informationData
//
//  Created by Jeni kakadiya on 6/30/21.
//  Copyright © 2021 Jeni kakadiya. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtEmailId: UITextField!
    
    @IBOutlet weak var ProgressView: UIProgressView!
    
    @IBOutlet weak var ProgressLabel: UILabel!
    
    @IBOutlet weak var buttonSubmit: UIButton!
    
    let progress = Progress(totalUnitCount: 3)
    var ratio:Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ProgressView.isHidden = true
        ratio = 0
        ProgressView.progress = ratio!
        ProgressLabel.isHidden = true
        ProgressView.layer.cornerRadius = 10
        buttonSubmit.layer.cornerRadius = 10
       
    }
    

    @IBAction func clickSubmitBtn(_ sender: UIButton) {
        if let text = txtFirstName.text, text.isEmpty{
            let AlertMessage = UIAlertController(title: "Alert", message: "please enter your First Name", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
               // print("Ok button tapped")
                
            })
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
               // print("Cancel button tapped")
            }
              AlertMessage.addAction(ok)
              AlertMessage.addAction(cancel)
            self.present(AlertMessage, animated: true, completion:  nil)
        }else if (txtLastName.text?.isEmpty)! {
            let AlertMessage = UIAlertController(title: "Alert", message: "please enter your Last Name", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            })
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
             }
            AlertMessage.addAction(ok)
            AlertMessage.addAction(cancel)
            self.present(AlertMessage, animated: true, completion:  nil)
        } else if (txtEmailId.text?.isEmpty)! {
                let AlertMessage = UIAlertController(title: "Alert", message: "please enter your email Id", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                })
                let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
                 }
                AlertMessage.addAction(ok)
                AlertMessage.addAction(cancel)
                self.present(AlertMessage, animated: true, completion:  nil)
        } else if(txtFirstName.text != "" && txtLastName.text != "" && txtEmailId.text != ""){
            buttonSubmit.isHidden = true
            ProgressLabel.isHidden = false
            ProgressView.isHidden = false
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){(timer) in
                guard self.progress.isFinished == false else {
                    timer.invalidate()
                    self.ProgressLabel.text = "Data Saved"
                    return
                }
                self.progress.completedUnitCount += 1
                            let progrsssFloat = Float(self.progress.fractionCompleted)
                self.ProgressView.setProgress(progrsssFloat, animated: true)
           
            }
        }
        else {
            
        }

     }
}

