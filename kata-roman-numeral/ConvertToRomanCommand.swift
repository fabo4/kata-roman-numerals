//
//  ConvertToRomanCommand.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 02/11/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

typealias ConverterToRomanCompletion = (response: String?, error: ErrorType?) -> Void

class ConvertToRomanCommand: BaseCommand<ConvertToRomanInteractor, String, String> {
    override func execute() throws -> Any? {
        return try receiver.convert(request)
    }
    
    override init(receiver: ConvertToRomanInteractor, request: String, completion: ConverterToRomanCompletion) {
        super.init(receiver: receiver, request: request, completion: completion)
    }
}

extension ConvertToRomanInteractor {
    func convert(request: String, completion: ConverterToRomanCompletion) -> Void {
        let command = ConvertToRomanCommand(receiver: self, request: request, completion: completion)
        Invoker(executor: BackgroundExecutor()).enqueueCommand(command)
    }
}