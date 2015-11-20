//
//  BasePresenter.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 20/11/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

public class BasePresenter<View> {
    weak var internalView: AnyObject?
    
    public var view: View? {
        get {
            return internalView as? View
        }
        set(newView) {
            internalView = newView as? AnyObject
        }
    }
}
