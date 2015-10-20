//
//  BaseInteractor.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 19/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

class BaseInteractor<T, U> {
    
    func execute(request: T) throws -> U? {
        fatalError("Execute() method must be overridden.")
    }
}
