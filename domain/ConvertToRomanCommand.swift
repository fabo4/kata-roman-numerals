//
//  ConvertToRomanCommand.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 02/11/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

public typealias ConverterToRomanCompletion = (response: ConvertToRomanResponse?, error: ErrorType?) -> Void

class ConvertToRomanCommand: BaseCommand<ConvertToRomanInteractor, ConvertToRomanRequest, ConvertToRomanResponse> {
    override func execute() throws -> Any? {
        return try receiver.convert(request)
    }
    
    override init(receiver: ConvertToRomanInteractor, request: ConvertToRomanRequest, completion: ConverterToRomanCompletion) {
        super.init(receiver: receiver, request: request, completion: completion)
    }
    
}

extension ConvertToRomanCommand: CustomStringConvertible {
    var description: String {
        return "ConvertToRoman, \(String(request)))"
    }
}