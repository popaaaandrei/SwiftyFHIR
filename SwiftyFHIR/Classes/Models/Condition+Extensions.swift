//
//  Condition+Extensions.swift
//  SwiftyFHIR
//
//  Created by Andrei on 22/07/2019.
//

import Foundation



public extension Condition {
    
    
    /// validation method
    func validate() throws {
        try basicResourceValidation()
        
        // if we have date
        if let date = onsetDateTime {
            guard date.isFHIRDateTime() else {
                throw FHIRError.regex(input: date)
            }
            
            try date.asFHIRDateTime()
        }
    }
    
}
