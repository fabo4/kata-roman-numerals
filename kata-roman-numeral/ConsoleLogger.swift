//
//  ConsoleLogger.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 10/11/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import domain

class ConsoleLogger: Logger {
    func log(level: LogLevel, message: String) {
        print(getLevelPrefix(level), message, separator: "", terminator: "\n")
    }
    
    func getLevelPrefix(level: LogLevel) -> String {
        switch level {
        case .Error:
            return "ERROR: "
        case .Warning:
            return "WARNING: "
        case .Info:
            return "INFO: "
        case .Debug:
            return "DEBUG: "
        }
    }
}
