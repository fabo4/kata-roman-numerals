//
//  BaseCommand.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 19/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

class BaseCommand<Receiver, Request, Response> : Command {
    
    let receiver: Receiver
    let request: Request
    let completion: (response: Response?, error: ErrorType?) -> Void
    
    init(receiver: Receiver, request: Request, completion: (response: Response?, error: ErrorType?) -> Void) {
        self.receiver = receiver
        self.request = request
        self.completion = completion
    }
    
    func execute() throws -> Any? {
        assertionFailure()
        return nil
    }
    
    func complete(response: Any?, error: ErrorType?) {
        self.completion(response: response as? Response, error: error)
    }
    
}