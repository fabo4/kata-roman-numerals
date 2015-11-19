//
//  RomanConverterViewController.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 08/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import UIKit
import presentation

class RomanConverterViewController: UIViewController, RomanConverterView, UITextFieldDelegate {
    
    @IBOutlet weak var arabicTextField: UITextField!
    @IBOutlet weak var romanLabel: UILabel!
    
    var presenter: ConvertToRomanPresenter?
    
    // MARK:- Actions
    @IBAction func convertArabicToRoman(sender: AnyObject) {
        presenter?.convert(arabicTextField.text!)
    }
    @IBAction func endEditing(sender: AnyObject) {
        view.endEditing(true)
    }
    
    // MARK:- Roman Converter View
    func showRoman(roman: String) {
        romanLabel.text = "Roman: \(roman)"
    }
}

