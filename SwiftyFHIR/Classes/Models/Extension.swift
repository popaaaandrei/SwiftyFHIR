//
//  Extension.swift
//  SwiftyFHIR
//
//  Created by Andrei on 10/04/2020.
//

import Foundation


/**
 🔥🔥🔥🔥🔥🔥🔥🔥🔥 NOT COMPLETE 🔥🔥🔥🔥🔥🔥🔥🔥🔥
 Optional Extensions Element.
 
 Optional Extension Element - found in all resources.
 */
public struct Extension: Codable {
    
    /// identifies the meaning of the extension.
    public var url: String?
    
    /// Value of extension.
    public var valueBoolean: Bool?
    
    /// Value of extension.
    public var valueCanonical: String?
    
    /// Value of extension.
    public var valueCode: String?
    
    /// Value of extension.
    public var valueCodeableConcept: CodeableConcept?
    
    /// Value of extension.
    public var valueCoding: Coding?
    
    /// Value of extension.
    public var valueDecimal: Double?
    
    /// Value of extension.
    public var valueInteger: Int?
    
    /// Value of extension.
    public var valueQuantity: Quantity?
    
    /// Value of extension.
    public var valueReference: Reference?
    
    /// Value of extension.
    public var valueString: String?
    
    /// Value of extension.
    public var valueUrl: String?
    
}



public extension Extension {
    
    /// convenience initializer
    init(key: String, value: String) {
        self.init()
        self.valueUrl = key
        self.valueString = value
    }
    
}



public extension ResourceType {

    /// set new identifier
    mutating func set(extensionKey: String, value: String) {
        let newExtension = Extension(key: extensionKey, value: value)
        
        /// if other identifiers exist
        if var extensions = self.extension {
            /// if there is already such identifier
            if let index = extensions
                .firstIndex(where: { $0.valueUrl == extensionKey }) {
                /// update value
                extensions[index] = newExtension
                /// update array
                self.extension = extensions
            
            /// append
            } else { self.extension?.append(newExtension) }
            
        /// doesn't exist -> create
        } else { self.extension = [newExtension] }
    }
    
    /// get extension value
    func get(extensionKey: String) -> String? {
        guard let extensions = self.extension,
            let value = extensions
                .first(where: { $0.valueUrl == extensionKey })?
                .valueString else { return nil }

        return value
    }
}
