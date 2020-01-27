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
    @discardableResult
    func validate() throws -> Observation {
        
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
        
        return try basicResourceValidation()
    }
    
}


public extension ObservationComponent {
    
    var value: String? {
        
        if let valueBoolean = valueBoolean {
            return String(describing: valueBoolean)
        }
        
        if let valueCodeableConcept = valueCodeableConcept,
            let coding = valueCodeableConcept.coding?.first {
            return String(describing: coding.display ?? coding.code)
        }
        
        if let valueDateTime = valueDateTime {
            return valueDateTime
        }
        
        if let valueInteger = valueInteger {
            return String(describing: valueInteger)
        }
        
        if let valueQuantity = valueQuantity {
            return String(describing: valueQuantity)
        }
        
        if let valueRange = valueRange {
            return String(describing: valueRange)
        }
        
        if let valueString = valueString {
            return valueString
        }
        
        return nil
    }
    
}
