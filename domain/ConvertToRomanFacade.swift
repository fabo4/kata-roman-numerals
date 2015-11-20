//
//  ConvertToRomanFacade.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 10/11/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

public class ConvertToRomanFacade: BaseFacade {
    public func convert(request: ConvertToRomanRequest, completion: ConverterToRomanCompletion) -> Void {
        let command = ConvertToRomanCommand(receiver: ConvertToRomanInteractor(), request: request, completion: completion)
        self.run(command)
    }
}


