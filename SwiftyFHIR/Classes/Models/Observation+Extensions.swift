//
//  Observation+Extensions.swift
//  Pods-SwiftyFHIR_Tests
//
//  Created by Andrei on 22/07/2019.
//

import Foundation




public extension Observation {
    
    /// extract quantity if present
    var __valueQuantity: String? {
        if let component = component?.first {
            return component.valueQuantity?.value?.description
        }
        
        return valueQuantity?.value?.description
    }
    
    
    /// validation method
    func validate() throws {
        try basicResourceValidation()
        
        // if we have date
        if let date = issued {
            guard date.isFHIRInstant() else {
                throw FHIRError.regex(input: date)
            }
        }
        
        // if we have date
        if let date = effectiveDateTime {
            guard date.isFHIRDateTime() else {
                throw FHIRError.regex(input: date)
            }
            
            try date.asFHIRDateTime()
        }
    }
    
}
