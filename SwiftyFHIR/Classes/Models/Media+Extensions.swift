//
//  Media+Extensions.swift
//  SwiftyFHIR
//
//  Created by Andrei on 22/07/2019.
//

import Foundation



public extension Media {
    
    
    /// validation method
    @discardableResult
    func validate() throws -> Media {
        
        // if we have date
        if let date = occurrenceDateTime {
            guard date.isFHIRDateTime() else {
                throw FHIRError.regex(input: date)
            }
            
            try date.asFHIRDateTime()
        }
        
        return try basicResourceValidation()
    }
    
}



//////////////////////////////////////////////////////
public extension Media {
    
    init(id: String = UUID().uuidString) {
        self.id = id
        self.resourceType = String(describing: Self.self)
    }
}
