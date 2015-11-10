//
//  ConvertToRomanInteractorTestCase.swift
//  ConvertToRomanInteractorTestCase
//
//  Created by Ondrej Fabian on 08/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import XCTest
@testable import domain

class ConvertToRomanInteractorTestCase: XCTestCase {
    
    let converter = ConvertToRomanInteractor()
    
    func testOne() {
        XCTAssertEqual(try! converter.convert(ConvertToRomanRequest(arabic:"1"))?.roman, "I")
    }
    
    func testTwo() {
        XCTAssertEqual(try! converter.convert(ConvertToRomanRequest(arabic:"2"))?.roman, "II")
    }
    
    func testFour() {
        XCTAssertEqual(try! converter.convert(ConvertToRomanRequest(arabic:"4"))?.roman, "IV")
    }
    
    func testFive() {
        XCTAssertEqual(try! converter.convert(ConvertToRomanRequest(arabic:"5"))?.roman, "V")
    }
    
    func testSeven() {
        XCTAssertEqual(try! converter.convert(ConvertToRomanRequest(arabic:"7"))?.roman, "VII")
    }
    
    func testNine() {
        XCTAssertEqual(try! converter.convert(ConvertToRomanRequest(arabic:"9"))?.roman, "IX")
    }
    
    func testTen() {
        XCTAssertEqual(try! converter.convert(ConvertToRomanRequest(arabic:"10"))?.roman, "X")
    }
    
    func testNineteenNinetyNine() {
        XCTAssertEqual(try! converter.convert(ConvertToRomanRequest(arabic:"1999"))?.roman, "MCMXCIX")
    }
    
    func testTwoThousandAndFive() {
        XCTAssertEqual(try! converter.convert(ConvertToRomanRequest(arabic:"2005"))?.roman, "MMV")
    }
}
