//
//  ConvertToRomanPresenter.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 11/11/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import domain

public protocol RomanConverterView {
    func showRoman(roman: String) -> Void
}


public class BasePresenter<View> {
    weak var internalView: AnyObject?
    var view: View? {
        return internalView as? View
    }
    
    init(view: View) {
        self.internalView = view as? AnyObject
    }
}

public class ConvertToRomanPresenter: BasePresenter<RomanConverterView> {

    let romanConverter: ConvertToRomanFacade
    
    public init(romanConverter: ConvertToRomanFacade, view: RomanConverterView?) {
        self.romanConverter = romanConverter
        super.init(view: view)
    }
    
    public func convert(arabic: String) -> Void {
        let request = ConvertToRomanRequest(arabic: arabic)
        romanConverter.convert(request) { (response, error) -> Void in
            if let roman = response {
                self.view?.showRoman(roman.roman)
            }
        }
    }
}
