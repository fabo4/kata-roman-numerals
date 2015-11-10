//
//  Invoker.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 19/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

class Invoker {
    
    let executor: Executor
    
    init(executor: Executor) {
        self.executor = executor
    }
    
    func enqueueCommand(command: Command) {
        executor.executeCommand(command)
    }
}


class LoggingInvoker: Invoker {
    
//    let logger: Logger
    
    override func enqueueCommand(command: Command) {
        
        print(command)
        
        super.enqueueCommand(command)
    }
}
