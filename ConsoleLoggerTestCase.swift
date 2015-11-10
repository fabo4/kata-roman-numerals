//
//  ConsoleLoggerTestCase.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 10/11/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import XCTest
@testable import kata_roman_numeral
@testable import domain

class ConsoleLoggerTestCase: XCTestCase {
    
    func testConsoleLogger() {
        
        let logger = ConsoleLogger()
        
//        let command = ConvertToRomanCommand(receiver: ConvertToRomanInteractor(), request: ConvertToRomanRequest(arabic: "123"), completion: { (response, error) -> Void in
//            
//            })
//        logger.log(LogLevel.Info, message: String(command))
    }
}
