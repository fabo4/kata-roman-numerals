//
//  Logger.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 10/11/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

public enum LogLevel {
    case Error
    case Warning
    case Info
    case Debug
}

public protocol Logger {
    func log(level: LogLevel, message: String)
}

extension Logger {
    func error(message: String) {
        log(LogLevel.Error, message: message)
    }
    
    func warning(message: String) {
        log(LogLevel.Warning, message: message)
    }
    
    func info(message: String) {
        log(LogLevel.Info, message: message)
    }
    
    func debug(message: String) {
        log(LogLevel.Debug, message: message)
    }
}
