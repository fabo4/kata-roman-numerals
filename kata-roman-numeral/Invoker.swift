//
//  Invoker.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 19/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

public class Invoker {
    
    let executor: Executor
    
    public init(executor: Executor) {
        self.executor = executor
    }
    
    func enqueueCommand(command: Command) {
        executor.executeCommand(command)
    }
}
