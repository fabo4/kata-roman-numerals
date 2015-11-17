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
import Swinject

class RomanConverterViewController: UIViewController, RomanConverterView, UITextFieldDelegate {
    
    @IBOutlet weak var arabicTextField: UITextField!
    @IBOutlet weak var romanLabel: UILabel!
    
    lazy var presenter: ConvertToRomanPresenter = {
        let container = Container()
        container.register(Executor.self, factory: { _ in
            BackgroundExecutor()
        })
        container.register(Logger.self, factory: { _ in
            ConsoleLogger()
        })
        
        container.register(Invoker.self, factory: { r in
            LoggingInvoker(executor: r.resolve(Executor.self)!, logger: r.resolve(Logger.self)!)
        })
        
        container.register(ConvertToRomanFacade.self, factory: { r in
            ConvertToRomanFacade(invoker: r.resolve(Invoker.self)!)
        })
        
        container.register(ConvertToRomanPresenter.self, factory: { r in
            ConvertToRomanPresenter(romanConverter: r.resolve(ConvertToRomanFacade.self)!)
        })

        return container.resolve(ConvertToRomanPresenter.self)!
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        presenter.view = self
    }
    
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

