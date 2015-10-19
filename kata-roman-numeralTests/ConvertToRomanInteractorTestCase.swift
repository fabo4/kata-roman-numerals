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
        XCTAssertEqual(converter.convert("1"), "I")
    }
    
    func testTwo() {
        XCTAssertEqual(converter.convert("2"), "II")
    }
    
    func testFour() {
        XCTAssertEqual(converter.convert("4"), "IV")
    }
    
    func testFive() {
        XCTAssertEqual(converter.convert("5"), "V")
    }
    
    func testSeven() {
        XCTAssertEqual(converter.convert("7"), "VII")
    }
    
    func testNine() {
        XCTAssertEqual(converter.convert("9"), "IX")
    }
    
    func testTen() {
        XCTAssertEqual(converter.convert("10"), "X")
    }
    
    func testNineteenNinetyNine() {
        XCTAssertEqual(converter.convert("1999"), "MCMXCIX")
    }
    
    func testTwoThousandAndFive() {
        XCTAssertEqual(converter.convert("2005"), "MMV")
    }
}
