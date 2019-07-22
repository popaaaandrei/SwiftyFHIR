//
//  Resource+Extensions.swift
//  Pods-SwiftyFHIR_Tests
//
//  Created by Andrei on 22/07/2019.
//

import Foundation



public extension ResourceType {
    
    /// extract date
    func date() throws -> Date? {
        if let condition = self as? Condition {
            return try condition.onsetDateTime?.asFHIRDateTime()
        }
        
        if let observation = self as? Observation {
            return try observation.effectiveDateTime?.asFHIRDateTime()
        }
        
        if let media = self as? Media {
            return try media.occurrenceDateTime?.asFHIRDateTime()
        }
        
        return nil
    }
    
    
    /// extract body site if present
    var __bodySite: String? {
        if let condition = self as? Condition {
            return condition.bodySite?.first?.coding?.first?.display
        }
        
        if let observation = self as? Observation {
            return observation.bodySite?.coding?.first?.display
        }
        
        if let media = self as? Media {
            return media.bodySite?.coding?.first?.display
        }
        
        return nil
    }
    
}
