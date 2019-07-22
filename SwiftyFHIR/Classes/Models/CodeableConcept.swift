//
//  CodeableConcept.swift
//  App
//
//  Created by Andrei on 15/07/2019.
//

import Foundation


/**
 Concept - reference to a terminology or just text. A concept that may be defined by a formal reference to a terminology or ontology or may be provided by text.
 */
public struct CodeableConcept: Codable {
    
    /// Code defined by a terminology system.
    public var coding: [Coding]?
    
    /// Plain text representation of the concept.
    public var text: String?
    
}


/**
 A reference to a code defined by a terminology system.
 */
public struct Coding: Codable {
    
    /// Symbol in syntax defined by the system.
    public var code: String?
    
    /// Representation defined by the system.
    public var display: String?
    
    /// Identity of the terminology system.
    public var system: String?
    
    /// If this coding was chosen directly by the user.
    public var userSelected: Bool?
    
    /// Version of the system - if relevant.
    public var version: String?
    
    
    public init(code: String? = nil,
                display: String? = nil,
                system: String? = nil,
                userSelected: Bool? = nil,
                version: String? = nil) {
        self.code = code
        self.display = display
        self.system = system
        self.userSelected = userSelected
        self.version = version
    }
    
    
    /// wrap Coding as CodeableConcept
    public var asCodeableConcept : CodeableConcept {
        var codeableConcept = CodeableConcept()
        codeableConcept.coding = [self]
        return codeableConcept
    }
    
}


extension Array where Element == Coding {
    
    /// wrap Coding as CodeableConcept
    public var asCodeableConcept : CodeableConcept {
        var codeableConcept = CodeableConcept()
        codeableConcept.coding = self
        return codeableConcept
    }
}
