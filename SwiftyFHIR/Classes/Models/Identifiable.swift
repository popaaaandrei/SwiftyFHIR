//
//  Identifiable.swift
//  SwiftyFHIR
//
//  Created by Andrei on 10/04/2020.
//

import Foundation



extension Organization : Identifiable {}
extension Patient : Identifiable {}
extension Practitioner : Identifiable {}



public protocol Identifiable {
    /// Identifies across multiple systems.
    var identifier: [Identifier]? { get set }
}



public extension Identifiable where Self : ResourceType {
    
    /// set new identifier
    mutating func set(identifierKey: String, value: String) {
        let newIdentifier = Identifier(value: value, system: identifierKey)
        
        /// if other identifiers exist
        if var identifiers = identifier {
            /// if there is already such identifier
            if let index = identifiers
                .firstIndex(where: { $0.system == identifierKey }) {
                /// update value
                identifiers[index] = newIdentifier
                /// update array
                self.identifier = identifiers
            
            /// append
            } else { self.identifier?.append(newIdentifier) }
            
        /// doesn't exist -> create
        } else { self.identifier = [newIdentifier] }
    }
    
    /// get identifier value
    func get(identifierKey: String) -> String? {
        guard let identifiers = identifier,
            let value = identifiers
                .first(where: { $0.system == identifierKey })?
                .value else { return nil }

        return value
    }
    
}
