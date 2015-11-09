//
//  InvokerTestCase.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 21/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import XCTest
@testable import domain

class InvokerTestCase: XCTestCase {

    func testInvoker() {
        
        var string = ""
        let expectation = expectationWithDescription("")

        MockInteractor().copyString("test") { (response, error) -> Void in
            string = response!
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5) { error in
            XCTAssertEqual(string, "testtest")
        }
        
    }
    
    typealias MockInteractorCompletion = (response: String?, error: ErrorType?) -> Void
    
    class MockInteractor {
        func copyString(request: String) throws -> String? {
            return request + request
        }
        
        func copyString(request: String, completion: MockInteractorCompletion) -> Void {
            let command = MockInteractorCommand(receiver: self, request: request, completion: completion)
            
            LoggingInvoker(executor: MockExecutor()).enqueueCommand(command)
        }
    }
    
    class MockInteractorCommand: BaseCommand<MockInteractor, String, String> {
        override init(receiver: MockInteractor, request: String, completion: MockInteractorCompletion) {
            super.init(receiver: receiver, request: request, completion: completion)
        }
        
        override func execute() throws -> Any? {
            return try receiver.copyString(request)
        }
    }
        
    class MockExecutor: Executor {
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
}
