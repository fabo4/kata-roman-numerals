//
//  Invoker.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 19/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import Foundation

class Invoker {
    
    func executeCommand<T, U>(interactor: BaseInteractor<T, U>,  request: T, completion: (response: U?, error: ErrorType?) -> Void ) {
        
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0)) { () -> Void in
            
            let response: U?
            let error: ErrorType?
            do {
                response = try interactor.execute(request)
                error = nil
            } catch let e {
                response = nil
                error = e
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(response: response, error: error)
            })
        }
    }
}
