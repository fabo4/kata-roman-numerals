//
//  LoggingInvoker.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 12/11/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

public class LoggingInvoker: Invoker {
    
    let logger: Logger
    
    public init(executor: Executor, logger: Logger) {
        self.logger = logger
        super.init(executor: executor)
    }
    
    override func enqueueCommand(command: Command) {
        logger.log(LogLevel.Info, message: String(command))
        super.enqueueCommand(command)
    }
}
