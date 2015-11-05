//
//  ConvertToRomanInteractorTestCase.swift
//  ConvertToRomanInteractorTestCase
//
//  Created by Ondrej Fabian on 08/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import XCTest
@testable import kata_roman_numeral

class ConvertToRomanInteractorTestCase: XCTestCase {
    
    let converter = ConvertToRomanInteractor()
    
    func testOne() {
        XCTAssertEqual(try! converter.convert("1"), "I")
    }
    
    func testTwo() {
        XCTAssertEqual(try! converter.convert("2"), "II")
    }
    
    func testFour() {
        XCTAssertEqual(try! converter.convert("4"), "IV")
    }
    
    func testFive() {
        XCTAssertEqual(try! converter.convert("5"), "V")
    }
    
    func testSeven() {
        XCTAssertEqual(try! converter.convert("7"), "VII")
    }
    
    func testNine() {
        XCTAssertEqual(try! converter.convert("9"), "IX")
    }
    
    func testTen() {
        XCTAssertEqual(try! converter.convert("10"), "X")
    }
    
    func testNineteenNinetyNine() {
        XCTAssertEqual(try! converter.convert("1999"), "MCMXCIX")
    }
    
    func testTwoThousandAndFive() {
        XCTAssertEqual(try! converter.convert("2005"), "MMV")
    }
}
