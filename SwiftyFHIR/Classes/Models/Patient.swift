//
//  Patient.swift
//  SwiftyFHIR
//
//  Created by Andrei on 22/03/2020.
//

import Foundation




/**
 🔥🔥🔥🔥🔥🔥🔥🔥🔥 NOT COMPLETE 🔥🔥🔥🔥🔥🔥🔥🔥🔥
 Measurements and simple assertions made about a patient, device or other subject.
 */
public struct Patient: ResourceType {
    
    
    /// ============= ResourceType ======================
    /// Logical id of this artifact.
    public var id: String
    
    /// Resource type
    public var resourceType: String {
        get { return "Patient" }
    }
    
    /// Metadata about the resource.
    public var meta: Meta?
    
    /// Additional content defined by implementations.
    public var `extension`: [Extension]?
    
    /// =================================================
    
    /// An identifier for this patient.
    public var identifier: [Identifier]?
    
    /// Whether this patient's record is in active use.
    public var active: Bool?
    
    /// A name associated with the patient.
    public var name: [HumanName]?
    
    /// Image of the patient.
    public var photo: [Attachment]?
    
    /// A contact detail for the individual.
    public var telecom: [ContactPoint]?
    
    /// Addresses for the individual.
    public var address: [Address]?
    
    /// The date of birth for the individual.
    public var birthDate: String?
    
    /// Administrative Gender - the gender that the patient is considered to have for administration and record keeping purposes.
    public var gender: AdministrativeGender?
    
    /// Patient's nominated primary care provider.
    public var generalPractitioner: [Reference]?
    
    /// Organization that is the custodian of the patient record.
    public var managingOrganization: Reference?
    
    /// Marital (civil) status of a patient.
    public var maritalStatus: CodeableConcept?
    
    /// A list of Languages which may be used to communicate with the patient about his or her health.
    public var communication: [PatientCommunication]?

}




/**
Name of a human - parts and usage.
A human's name with the ability to identify parts and usage.
*/
public struct HumanName: Codable {
    
    /// Family name (often called 'Surname').
    public var family: String?
    
    /// Given names (not always 'first'). Includes middle names.
    public var given: [String]?
    
    /// Time period when name was/is in use.
    public var period: Period?
    
    /// Parts that come before the name.
    public var prefix: [String]?
    
    /// Parts that come after the name.
    public var suffix: [String]?
    
    /// Text representation of the full name.
    public var text: String?
    
    /// Identifies the purpose for this name.
    public var use: NameUse?

}



/**
Details of a Technology mediated contact point (phone, fax, email, etc.).

Details for all kinds of technology mediated contact points for a person or organization, including telephone, email,
etc.
*/
public struct ContactPoint: Codable {

    /// Time period when the contact point was/is in use.
    public var period: Period?
    
    /// Specify preferred order of use (1 = highest).
    public var rank: Int?
    
    /// Telecommunications form for contact point - what communications system is required to make use of the contact.
    public var system: ContactPointSystem?
    
    /// Identifies the purpose for the contact point.
    public var use: ContactPointUse?
    
    /// The actual contact point details.
    public var value: String?
    
}



/**
A list of Languages which may be used to communicate with the patient about his or her health.

Languages which may be used to communicate with the patient about his or her health.
*/
public struct PatientCommunication: Codable {

    /// The language which can be used to communicate with the patient about his or her health.
    public var language: CodeableConcept?
    
    /// Language preference indicator.
    public var preferred: Bool?

}
