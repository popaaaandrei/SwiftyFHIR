//
//  Identifier.swift
//  SwiftyFHIR
//
//  Created by Andrei on 22/03/2020.
//

import Foundation


/**
An identifier intended for computation.

A technical identifier - identifies some entity uniquely and unambiguously.
*/
public struct Identifier: Codable {
    
    /// Organization that issued id (may be just text).
    public var assigner: Reference?
    
    /// Time period when id is/was valid for use.
    public var period: Period?
    
    /// The namespace for the identifier value.
    public var system: String?
    
    /// Description of identifier.
    public var type: CodeableConcept?
    
    /// The purpose of this identifier.
    public var use: IdentifierUse?
    
    /// The value that is unique.
    public var value: String?

}



public extension Identifier {

    /// default initializer
    init(value: String, system: String) {
        self.value = value
        self.system = system
    }

}
