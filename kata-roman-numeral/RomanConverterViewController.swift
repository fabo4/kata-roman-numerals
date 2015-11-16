//
//  RomanConverterViewController.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 08/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import UIKit
import presentation
import domain

class RomanConverterViewController: UIViewController, RomanConverterView, UITextFieldDelegate {
    
    @IBOutlet weak var arabicTextField: UITextField!
    @IBOutlet weak var romanLabel: UILabel!
    
    lazy var presenter: RomanConverterPresenter = {
        
//        let executor = BackgroundExecutor()
//        let logger = ConsoleLogger()
//        let invoker = LoggingInvoker(executor: executor, logger: logger)
//        let converter = ConverToRomanFacade(invoker: invoker)
        let assembly = ConvertToRomanFacadeAssembly().activate()
        let converter = assembly.convertToRomanFacade() as! ConverToRomanFacade
        return RomanConverterPresenter(romanConverter: converter, view: self)
    }()
    
    // MARK:- Actions
    @IBAction func convertArabicToRoman(sender: AnyObject) {
        presenter.convert(arabicTextField.text!)
    }
    @IBAction func endEditing(sender: AnyObject) {
        view.endEditing(true)
    }
    
    // MARK:- Roman Converter View
    func showRoman(roman: String) {
        romanLabel.text = "Roman: \(roman)"
    }
}

