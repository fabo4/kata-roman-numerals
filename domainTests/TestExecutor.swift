//
//  TestExecutor.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 10/11/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

@testable import domain

class TestExecutor: Executor {
    func executeCommand(command: Command) {
        let response: Any?
        let error: ErrorType?
        do {
            response = try command.execute()
            error = nil
        } catch let e {
            response = nil
            error = e
        }
        command.complete(response, error: error)
    }
}
