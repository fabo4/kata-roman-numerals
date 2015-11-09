//
//  BackgroundExecutor.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 05/11/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import Foundation
import domain

class BackgroundExecutor: Executor {
    
    func executeCommand(command: Command) {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0)) { () -> Void in
            let response: Any?
            let error: ErrorType?
            do {
                response = try command.execute()
                error = nil
            } catch let e {
                response = nil
                error = e
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                command.complete(response, error: error)
            })
        }
    }
}
