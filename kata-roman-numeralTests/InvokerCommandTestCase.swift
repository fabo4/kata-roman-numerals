//
//  InvokerTestCase.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 21/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import XCTest
@testable import kata_roman_numeral

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
}

class MockInteractor {
    func copyString(request: String) throws -> String? {
        return request + request
    }
}

typealias MockInteractorCompletion = (response: String?, error: ErrorType?) -> Void

class MockInteractorCommand: BaseCommand<MockInteractor, String, String> {
    override init(receiver: MockInteractor, request: String, completion: MockInteractorCompletion) {
        super.init(receiver: receiver, request: request, completion: completion)
    }
    
    override func execute() throws -> Any? {
        return try receiver.copyString(request)
    }
}

extension MockInteractor {
    func copyString(request: String, completion: MockInteractorCompletion) -> Void {
        let command = MockInteractorCommand(receiver: self, request: request, completion: completion)
        Invoker(executor: BackgroundExecutor()).enqueueCommand(command)
    }
}
