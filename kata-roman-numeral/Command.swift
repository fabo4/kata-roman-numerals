//
//  Command.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 09/11/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

public protocol Command {
    func execute() throws -> Any?
    func complete(response: Any?, error: ErrorType?) -> Void
}

