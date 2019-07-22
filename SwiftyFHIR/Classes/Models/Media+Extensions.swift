//
//  Media+Extensions.swift
//  SwiftyFHIR
//
//  Created by Andrei on 22/07/2019.
//

import Foundation




public extension Media {
    
    
    /// validation method
    func validate() throws {
        try basicResourceValidation()
        
        // if we have date
        if let date = occurrenceDateTime {
            guard date.isFHIRDateTime() else {
                throw FHIRError.regex(input: date)
            }
            
            try date.asFHIRDateTime()
        }
    }
    
}
