//
//  Invoker.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 19/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

protocol Command {
    func execute() throws -> Any?
    func complete(response: Any?, error: ErrorType?) -> Void
}

protocol Executor {
    func executeCommand(command: Command)
}

class Invoker {
    
    let executor: Executor
    
    init(executor: Executor) {
        self.executor = executor
    }
    
    func enqueueCommand(command: Command) {
        
        // Log, queue, whatever...
        print(command)
        executor.executeCommand(command)
    }
}
