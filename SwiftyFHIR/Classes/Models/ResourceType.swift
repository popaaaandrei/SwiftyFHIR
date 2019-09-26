//
//  Resource+Extensions.swift
//  Pods-SwiftyFHIR_Tests
//
//  Created by Andrei on 22/07/2019.
//

import Foundation




public protocol ResourceType {
    
    /// Logical id of this artifact.
    var id: String { get }
    
    /// The type of the resource or element.
    var resourceType: String { get }
    
    /// Metadata about the resource.
    var meta: Meta? { get }
    
    /// Additional content defined by implementations.
    var `extension`: [Extension]? { get }
    
    /// method for validation
    func validate() throws -> Self
    
}




public extension ResourceType {
    
    /// extract date
    func __date() throws -> Date? {
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
    
    /// main CodeableConcept
    var __codeableConcept: CodeableConcept? {
        if let code = (self as? Condition)?.code {
            return code
        }
        
        if let code = (self as? Observation)?.code {
            return code
        }
        
        if let code = (self as? Media)?.subtype {
            return code
        }
        
        return nil
    }
    
    
    /// extract Coding and match Concept
    func __concept() throws -> Concept {
        // take all codes
        if let coding =  __codeableConcept?.coding {
            for code in coding  {
                // if we have a mapping
                if let concept = Concept.mappings[code] {
                    return concept
                }
            }
        }
        
        throw FHIRError.conceptNotFound(concept: "\(String(describing: __codeableConcept))")
    }
    
    
}
