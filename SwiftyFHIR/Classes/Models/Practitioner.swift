//
//  Practitioner.swift
//  SwiftyFHIR
//
//  Created by Andrei on 02/04/2020.
//

import Foundation



/**
 A person who is directly or indirectly involved in the provisioning of healthcare.
 */
public struct Practitioner: ResourceType {
    
    
    /// ============= ResourceType ======================
    /// Logical id of this artifact.
    public var id: String
    
    /// Resource type
    public var resourceType: String
    
    /// Metadata about the resource.
    public var meta: Meta?
    
    /// Additional content defined by implementations.
    public var `extension`: [Extension]?
    
    /// =================================================
    
    /// A identifier for the person as this agent.
    public var identifier: [Identifier]?
    
    /// Whether this practitioner's record is in active use.
    public var active: Bool?
    
    /// The name(s) associated with the practitioner.
    public var name: [HumanName]?
    
    /// Image of the person.
    public var photo: [Attachment]?
    
    /// Address(es) of the practitioner that are not role specific (typically home address).
    public var address: [Address]?
    
    /// The date of birth for the individual.
    public var birthDate: String?
    
    /// A contact detail for the individual.
    public var telecom: [ContactPoint]?
    
    /// Qualifications obtained by training and certification.
    public var qualification: [PractitionerQualification]?
    
    /// A language the practitioner is able to use in patient communication.
    public var communication: [CodeableConcept]?
    
    /// Administrative Gender
    public var gender: AdministrativeGender?


}



/**
Qualifications obtained by training and certification.
*/
public struct PractitionerQualification: Codable {
    
    /// Coded representation of the qualification.
    public var code: CodeableConcept?
    
    /// An identifier for this qualification for the practitioner.
    public var identifier: [Identifier]?
    
    /// Organization that regulates and issues the qualification.
    public var issuer: Reference?
    
    /// Period during which the qualification is valid.
    public var period: Period?
    
    /// public initializer
    public init(code: CodeableConcept? = nil,
                identifier: [Identifier]? = nil,
                issuer: Reference? = nil,
                period: Period? = nil) {
        
        self.code = code
        self.identifier = identifier
        self.issuer = issuer
        self.period = period
    }

}
