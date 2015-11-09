//
//  BackgroundExecutorTestCase.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 09/11/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import XCTest
@testable import kata_roman_numeral
@testable import domain

class BackgroundExecutorTestCase: XCTestCase {

    func testBackgroundExecutor() {
        
        let expectation = expectationWithDescription("")
       
        let command = MockCommand(expectation: expectation)
        let executor = BackgroundExecutor()

        executor.executeCommand(command)
        
        waitForExpectationsWithTimeout(5) { error in
            
        }
    }
    
    class MockCommand: Command {
        
        let expectation: XCTestExpectation
        
        init(expectation: XCTestExpectation) {
            self.expectation = expectation
        }
        
        func execute() throws -> Any? {
            XCTAssertFalse(NSThread.isMainThread())
            return nil
        }
        
        func complete(response: Any?, error: ErrorType?) {
            XCTAssertTrue(NSThread.isMainThread())
            expectation.fulfill()
        }
    }
}



