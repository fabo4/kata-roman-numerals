//
//  Invoker.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 19/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

protocol Invoker {
   func enqueueCommand(command: Command)
}

class LoggingInvoker: Invoker {
    
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
