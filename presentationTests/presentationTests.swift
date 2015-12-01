//
//  presentationTests.swift
//  presentationTests
//
//  Created by Ondrej Fabian on 11/11/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import XCTest
@testable import presentation
@testable import domain

class RomanConverterTestCase: XCTestCase {
    
    func testPresenterConversion() {

        let expectation = expectationWithDescription("")
        let converter = ConvertToRomanFacade(invoker: Invoker(executor: TestExecutor()))
        let view = RomanConverterTestView(expectation: expectation)
        let presenter = ConvertToRomanPresenter(romanConverter: converter)
        presenter.view = view
        presenter.convert("")
        
        waitForExpectationsWithTimeout(5, handler: nil)
    }
    
    class RomanConverterTestView: RomanConverterView {
        
        let expectation: XCTestExpectation
        
        init(expectation: XCTestExpectation) {
            self.expectation = expectation
        }
        
        func showRoman(roman: String) -> Void {
            expectation.fulfill()
        }
    }
    
}
