//
//  information.swift
//  informationData
//
//  Created by Jeni kakadiya on 6/25/21.
//  Copyright © 2021 Jeni kakadiya. All rights reserved.
//

import Foundation
import UIKit

class information: NSObject {
    func makeButton(title:String, button: UIButton, titleColor: UIColor = .clear, background: UIColor = .clear, font: UIFont? = nil, cornerRadius: CGFloat = 0) -> UIButton {
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = background
        button.titleLabel?.font = font
        button.layer.cornerRadius = 6.0
        
        return button
    }
    
    func testString(title: String) -> String {
        return title
    }
    
    func createTextField(placeholder:String, myTextField: UITextField, background: UIColor = .clear, fontColor: UIColor = .clear, cornerRadius: CGFloat = 0) -> UITextField {
        myTextField.placeholder = "Place holder text"
        myTextField.backgroundColor = background
        myTextField.textColor = fontColor
        myTextField.layer.cornerRadius = 6.0
        
        return myTextField

    }
}












/*
let button = makeButton(title: "Login", titleColor: .blue, background: .white)
    
  
func makeButton(title: String? = nil, titleColor: UIColor = .black, background: UIColor = .clear) -> UIButton {
       let button = UIButton()
      // button.translatesAutoresizingMaskIntoConstraints = false
       button.setTitle(title, for: .normal)
       button.backgroundColor = background
    button.setTitleColor(titleColor, for:.normal)
       return button
     }
*/

