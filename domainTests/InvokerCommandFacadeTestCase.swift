//
//  InvokerCommandFacadeTestCase.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 21/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import XCTest
@testable import domain

class InvokerCommandFacadeTestCase: XCTestCase {

    func testInvoker() {
        
        var string = ""
        let expectation = expectationWithDescription("")
        let invoker = Invoker(executor: TestExecutor())
        
        TestFacade(invoker: invoker).duplicateString("test") { (response, error) -> Void in
            string = response!
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5) { error in
            XCTAssertEqual(string, "testtest")
        }
        
    }
    
    class TestInteractor {
        func duplicateString(request: String) throws -> String? {
            return request + request
        }
    }
    
    typealias TestInteractorCompletion = (response: String?, error: ErrorType?) -> Void
    
    class TestCommand: BaseCommand<TestInteractor, String, String> {
        override init(receiver: TestInteractor, request: String, completion: TestInteractorCompletion) {
            super.init(receiver: receiver, request: request, completion: completion)
        }
        
        override func execute() throws -> Any? {
            return try receiver.duplicateString(request)
        }
    }
    
    class TestFacade: BaseFacade {
        func duplicateString(request: String, completion: TestInteractorCompletion) {
            let command = TestCommand(receiver: InvokerCommandFacadeTestCase.TestInteractor(), request: request, completion: completion)
            self.run(command)
        }
    }

}
