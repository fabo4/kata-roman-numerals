//
//  BaseFacade.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 10/11/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

public class BaseFacade {
    let invoker: Invoker
    
    public init(invoker: Invoker) {
        self.invoker = invoker
    }
    
    func run(command: Command) {
        self.invoker.enqueueCommand(command)
    }
}
