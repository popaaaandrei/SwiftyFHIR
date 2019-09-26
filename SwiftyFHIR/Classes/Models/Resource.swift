//
//  Resource.swift
//  App
//
//  Created by Andrei on 15/07/2019.
//

import Foundation






public struct Reference: Codable {
    
    /// Text alternative for the resource.
    public var display: String?
    
    /// Logical reference, when literal reference is not known.
    public var identifier: String?
    
    /// Literal reference, Relative, internal or absolute URL.
    public var reference: String?
    
    
    public init(display: String? = nil,
                identifier: String? = nil,
                reference: String? = nil) {
        self.display = display
        self.identifier = identifier
        self.reference = reference
    }
    
    
    /// returns the identifier after "Patient/"
    public var patientIdentifier: String? {
        // if we have a reference
        guard let reference = reference,
            // and includes the patient
            let range = reference.range(of: "Patient/") else {
            return nil
        }
        return String(reference[range.upperBound...])
    }
    
}


public struct Meta: Codable {

    /// Profiles this resource claims to conform to.
    public var profile: [String]?
    
    /// Security Labels applied to this resource.
    public var security: [Coding]?
    
    
    public init(profile: [String]? = nil,
                security: [Coding]? = nil) {
        self.profile = profile
        self.security = security
    }
    
    public init(profile: String) {
        self.profile = [profile]
    }

}


public extension String {
    
    var profileMeta: Meta {
        return Meta(profile: self)
    }
    
}


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


/**
 Set of values bounded by low and high.
 
 A set of ordered Quantities defined by a low and high limit.
 */
public struct Range: Codable {
    /// High limit.
    public var high: Quantity?
    
    /// Low limit.
    public var low: Quantity?
}
