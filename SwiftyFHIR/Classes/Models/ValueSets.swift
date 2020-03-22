//
//  ValueSets.swift
//  SwiftyFHIR
//
//  Created by Andrei on 21/07/2019.
//

import Foundation






/**
 The verification status to support or decline the clinical status of the condition or diagnosis.
 
 URL: http://hl7.org/fhir/condition-ver-status
 ValueSet: http://hl7.org/fhir/ValueSet/condition-ver-status
 */
public enum ConditionVerificationStatus: String, Codable {
    
    /// This is a tentative diagnosis - still a candidate that is under consideration.
    case provisional = "provisional"
    
    /// One of a set of potential (and typically mutually exclusive) diagnoses asserted to further guide the diagnostic
    /// process and preliminary treatment.
    case differential = "differential"
    
    /// There is sufficient diagnostic and/or clinical evidence to treat this as a confirmed condition.
    case confirmed = "confirmed"
    
    /// This condition has been ruled out by diagnostic and clinical evidence.
    case refuted = "refuted"
    
    /// The statement was entered in error and is not valid.
    case enteredInError = "entered-in-error"
    
    /// The condition status is unknown.  Note that "unknown" is a value of last resort and every attempt should be made
    /// to provide a meaningful value other than "unknown".
    case unknown = "unknown"
    
    
    /// CodeableConcept
    public var concept: CodeableConcept {
        // HL7 terminology
        return Coding(code: rawValue, system: Terminology.ConditionVerificationStatus.system).asCodeableConcept
    }
    
}




/**
 Condition Clinical Status Codes
 Definition: Preferred value set for Condition Clinical Status.
 This value set contains 5 concepts
 
 URL: http://hl7.org/fhir/condition-clinical
 ValueSet: http://hl7.org/fhir/STU3/valueset-condition-clinical.html
 
 **/
public enum ConditionClinicalStatus: String, Codable {
    
    /// The subject is currently experiencing the symptoms of the condition or there is evidence of the condition.
    case active = "active"
    
    /// The subject is having a relapse or re-experiencing the condition after a period of remission or presumed resolution.
    case recurrence = "recurrence"
    
    /// The subject is no longer experiencing the symptoms of the condition or there is no longer evidence of the condition.
    case inactive = "inactive"
    
    /// The subject is no longer experiencing the symptoms of the condition, but there is a risk of the symptoms returning.
    case remission = "remission"
    
    /// The subject is no longer experiencing the symptoms of the condition and there is a negligible perceived risk of the symptoms returning.
    case resolved = "resolved"
    
    
    
    /// CodeableConcept
    public var concept: CodeableConcept {
        // HL7 terminology
        return Coding(code: rawValue, system: Terminology.ConditionClinicalStatus.system).asCodeableConcept
    }
    
}




/**
 Whether the media is a photo, video, or audio
 
 URL: http://hl7.org/fhir/digital-media-type
 ValueSet: http://hl7.org/fhir/ValueSet/digital-media-type
 */
public enum DigitalMediaType: String, Codable {
    
    /// The media consists of one or more unmoving images, including photographs, computer-generated graphs and charts,
    /// and scanned documents
    case photo = "photo"
    
    /// The media consists of a series of frames that capture a moving image
    case video = "video"
    
    /// The media consists of a sound recording
    case audio = "audio"
    
    /// CodeableConcept
    public var concept: CodeableConcept {
        // HL7 terminology
        return Coding(code: rawValue, system: Terminology.DigitalMediaType.system).asCodeableConcept
    }
    
    
}




/**
 Codes providing the status of an observation.
 
 URL: http://hl7.org/fhir/observation-status
 ValueSet: http://hl7.org/fhir/ValueSet/observation-status
 */
public enum ObservationStatus: String, Codable {
    
    /// The existence of the observation is registered, but there is no result yet available.
    case registered = "registered"
    
    /// This is an initial or interim observation: data may be incomplete or unverified.
    case preliminary = "preliminary"
    
    /// The observation is complete.
    case final = "final"
    
    /// Subsequent to being Final, the observation has been modified subsequent.  This includes updates/new information
    /// and corrections.
    case amended = "amended"
    
    /// Subsequent to being Final, the observation has been modified to correct an error in the test result.
    case corrected = "corrected"
    
    /// The observation is unavailable because the measurement was not started or not completed (also sometimes called
    /// "aborted").
    case cancelled = "cancelled"
    
    /// The observation has been withdrawn following previous final release.  This electronic record should never have
    /// existed, though it is possible that real-world decisions were based on it. (If real-world activity has occurred,
    /// the status should be "cancelled" rather than "entered-in-error".)
    case enteredInError = "entered-in-error"
    
    /// The authoring system does not know which of the status values currently applies for this request. Note: This
    /// concept is not to be used for "other" - one of the listed statuses is presumed to apply, but the authoring
    /// system does not know which.
    case unknown = "unknown"
}



/**
 A coded concept defining if the medication is in active use
 
 URL: http://hl7.org/fhir/medication-status
 ValueSet: http://hl7.org/fhir/ValueSet/medication-status
 */
public enum MedicationStatus: String, Codable {
    
    /// The medication is available for use
    case active = "active"
    
    /// The medication is not available for use
    case inactive = "inactive"
    
    /// The medication was entered in error
    case enteredInError = "entered-in-error"
}




/**
Telecommunications form for contact point

URL: http://hl7.org/fhir/contact-point-system
ValueSet: http://hl7.org/fhir/ValueSet/contact-point-system
*/
public enum ContactPointSystem: String, Codable {
    
    /// The value is a telephone number used for voice calls. Use of full international numbers starting with + is
    /// recommended to enable automatic dialing support but not required.
    case phone = "phone"
    
    /// The value is a fax machine. Use of full international numbers starting with + is recommended to enable automatic
    /// dialing support but not required.
    case fax = "fax"
    
    /// The value is an email address.
    case email = "email"
    
    /// The value is a pager number. These may be local pager numbers that are only usable on a particular pager system.
    case pager = "pager"
    
    /// A contact that is not a phone, fax, pager or email address and is expressed as a URL.  This is intended for
    /// various personal contacts including blogs, Skype, Twitter, Facebook, etc. Do not use for email addresses.
    case url = "url"
    
    /// A contact that can be used for sending an sms message (e.g. mobide phones, some landlines)
    case sms = "sms"
    
    /// A contact that is not a phone, fax, page or email address and is not expressible as a URL.  E.g. Internal mail
    /// address.  This SHOULD NOT be used for contacts that are expressible as a URL (e.g. Skype, Twitter, Facebook,
    /// etc.)  Extensions may be used to distinguish "other" contact types.
    case other = "other"
}



/**
Use of contact point

URL: http://hl7.org/fhir/contact-point-use
ValueSet: http://hl7.org/fhir/ValueSet/contact-point-use
*/
public enum ContactPointUse: String, Codable {
    
    /// A communication contact point at a home; attempted contacts for business purposes might intrude privacy and
    /// chances are one will contact family or other household members instead of the person one wishes to call.
    /// Typically used with urgent cases, or if no other contacts are available.
    case home = "home"
    
    /// An office contact point. First choice for business related contacts during business hours.
    case work = "work"
    
    /// A temporary contact point. The period can provide more detailed information.
    case temp = "temp"
    
    /// This contact point is no longer in use (or was never correct, but retained for records).
    case old = "old"
    
    /// A telecommunication device that moves and stays with its owner. May have characteristics of all other use codes,
    /// suitable for urgent matters, not the first choice for routine business.
    case mobile = "mobile"
}




/**
The type of an address (physical / postal)

URL: http://hl7.org/fhir/address-type
ValueSet: http://hl7.org/fhir/ValueSet/address-type
*/
public enum AddressType: String, Codable {
    
    /// Mailing addresses - PO Boxes and care-of addresses.
    case postal = "postal"
    
    /// A physical address that can be visited.
    case physical = "physical"
    
    /// An address that is both physical and postal.
    case both = "both"
}


/**
The use of an address

URL: http://hl7.org/fhir/address-use
ValueSet: http://hl7.org/fhir/ValueSet/address-use
*/
public enum AddressUse: String, Codable {
    
    /// A communication address at a home.
    case home = "home"
    
    /// An office address. First choice for business related contacts during business hours.
    case work = "work"
    
    /// A temporary address. The period can provide more detailed information.
    case temp = "temp"
    
    /// This address is no longer in use (or was never correct, but retained for records).
    case old = "old"
}



/**
The gender of a person used for administrative purposes.

URL: http://hl7.org/fhir/administrative-gender
ValueSet: http://hl7.org/fhir/ValueSet/administrative-gender
*/
public enum AdministrativeGender: String, Codable {
    
    /// Male
    case male = "male"
    
    /// Female
    case female = "female"
    
    /// Other
    case other = "other"
    
    /// Unknown
    case unknown = "unknown"
}



/**
Identifies the purpose for this identifier, if known .

URL: http://hl7.org/fhir/identifier-use
ValueSet: http://hl7.org/fhir/ValueSet/identifier-use
*/
public enum IdentifierUse: String, Codable {
    
    /// The identifier recommended for display and use in real-world interactions.
    case usual = "usual"
    
    /// The identifier considered to be most trusted for the identification of this item.
    case official = "official"
    
    /// A temporary identifier.
    case temp = "temp"
    
    /// An identifier that was assigned in secondary use - it serves to identify the object in a relative context, but
    /// cannot be consistently assigned to the same object again in a different context.
    case secondary = "secondary"
}



/**
The use of a human name

URL: http://hl7.org/fhir/name-use
ValueSet: http://hl7.org/fhir/ValueSet/name-use
*/
public enum NameUse: String, Codable {
    
    /// Known as/conventional/the one you normally use
    case usual = "usual"
    
    /// The formal name as registered in an official (government) registry, but which name might not be commonly used.
    /// May be called "legal name".
    case official = "official"
    
    /// A temporary name. Name.period can provide more detailed information. This may also be used for temporary names
    /// assigned at birth or in emergency situations.
    case temp = "temp"
    
    /// A name that is used to address the person in an informal manner, but is not part of their formal or usual name
    case nickname = "nickname"
    
    /// Anonymous assigned name, alias, or pseudonym (used to protect a person's identity for privacy reasons)
    case anonymous = "anonymous"
    
    /// This name is no longer in use (or was never correct, but retained for records)
    case old = "old"
    
    /// A name used prior to changing name because of marriage. This name use is for use by applications that collect
    /// and store names that were used prior to a marriage. Marriage naming customs vary greatly around the world, and
    /// are constantly changing. This term is not gender specific. The use of this term does not imply any particular
    /// history for a person's name
    case maiden = "maiden"
}
