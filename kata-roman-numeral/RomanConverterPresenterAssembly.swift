//
//  RomanConverterPresenterAssembly.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 13/11/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import Typhoon
import domain

//public class RomanConverterPresenterAssembly: TyphoonAssembly {
//    
//    public dynamic func romanConverterViewController() -> AnyObject {
//        
//        return TyphoonDefinition.withClass(RomanConverterPresenter.self) { (definition) in
//            definition.useInitializer("init:view:", parameters: { (initializer) in
//                initializer.injectParameterWith(self.converterToRomanFacade())
//                initializer.injectParameterWith(self.converterToRomanFacade())
//            })
//        }
//    }
//    
//    public dynamic func converterToRomanFacade() -> AnyObject {
//        
//    }
//}

public class ConvertToRomanFacadeAssembly: TyphoonAssembly {
    public dynamic func convertToRomanFacade() -> AnyObject {
        return TyphoonDefinition.withClass(ConverToRomanFacade.self, configuration: { (definition) in
            definition.useInitializer("init:", parameters: { (initializer) in
                initializer.injectParameterWith(self.loggingInvoker())
            })
        })
    }
    
    public dynamic func loggingInvoker() -> AnyObject {
        return TyphoonDefinition.withClass(LoggingInvoker.self, configuration: { (definition) in
            definition.useInitializer("init:logger:", parameters: { (initializer) in
                initializer.injectParameterWith(self.backgroundExecutor())
                initializer.injectParameterWith(self.consoleLogger())
            })
        })
    }
    
    public dynamic func backgroundExecutor() -> AnyObject {
        return TyphoonDefinition.withClass(LoggingInvoker.self)
    }
    
    public dynamic func consoleLogger() -> AnyObject {
        return TyphoonDefinition.withClass(ConsoleLogger.self)
    }
}
