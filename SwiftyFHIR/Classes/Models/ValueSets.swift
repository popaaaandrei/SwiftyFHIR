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
