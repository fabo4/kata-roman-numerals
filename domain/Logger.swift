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
