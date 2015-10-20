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
        let invoker = Invoker()
        var string = ""
        let expectation = expectationWithDescription("")
        invoker.executeCommand(MockInteractor(), request: "test") { (response, error) -> Void in
            string = response!
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5) { error in
            XCTAssertEqual(string, "testtest")
        }
        
    }
    
    class MockInteractor: BaseInteractor<String, String> {
        override func execute(request: String) throws -> String? {
            return request + request
        }
    }
    
}