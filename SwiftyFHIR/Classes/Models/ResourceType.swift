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
    func getDate() throws -> Date {
        if let onsetDateTime = (self as? Condition)?.onsetDateTime {
            return try onsetDateTime.asFHIRDateTime()
        }
        
        if let effectiveDateTime = (self as? Observation)?.effectiveDateTime {
            return try effectiveDateTime.asFHIRDateTime()
        }
        
        if let occurrenceDateTime = (self as? Media)?.occurrenceDateTime {
            return try occurrenceDateTime.asFHIRDateTime()
        }
        
        throw FHIRError.validation(message: "Resource '\(resourceType)', id '\(id)' does not have a valid Date field")
    }
    
    
}
