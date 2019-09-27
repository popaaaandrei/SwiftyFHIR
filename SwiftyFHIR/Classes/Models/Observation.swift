//
//  Observation.swift
//  App
//
//  Created by Andrei on 15/07/2019.
//

import Foundation


/**
 🔥🔥🔥🔥🔥🔥🔥🔥🔥 NOT COMPLETE 🔥🔥🔥🔥🔥🔥🔥🔥🔥
 Measurements and simple assertions.
 Measurements and simple assertions made about a patient, device or other subject.
 */
public struct Observation: Codable, ResourceType, SubjectIdentifiable {
    
    /// ============= ResourceType ======================
    /// Logical id of this artifact.
    public var id: String
    
    /// Resource type
    public var resourceType: String
    
    /// Metadata about the resource.
    public var meta: Meta?
    
    /// Additional content defined by implementations.
    public var `extension`: [Extension]?
    
    /// ============== Dates ============================
    /// Date/Time this was made available.
    public var issued: String?
    
    /// Clinically relevant time/time-period for observation.
    public var effectiveDateTime: String?
    /// =================================================
        
    /// The status of the result value.
    public var status: ObservationStatus?
    
    /// Who and/or what this is about.
    public var subject: Reference?
    
    /// Who is responsible for the observation.
    public var performer: [Reference]?
    
    /// Type of observation (code / type).
    public var code: CodeableConcept?
    
    /// Classification of  type of observation.
    public var category: [CodeableConcept]?
    
    /// Observed body part.
    public var bodySite: CodeableConcept?
    
    /// How it was done.
    public var method: CodeableConcept?
    
    /// (Measurement) Device.
    public var device: Reference?
    
    
    ///////////////////// Values /////////////////////////
    /// Actual result.
    public var valueQuantity: Quantity?
    /// Actual result.
    public var valueBoolean: Bool?
    /// Actual result.
    public var valueCodeableConcept: CodeableConcept?
    /// Actual result.
    public var valueDateTime: String?
    /// Actual result.
    public var valueString: String?
    //////////////////////////////////////////////////////
    
    /// Component results.
    public var component: [ObservationComponent]?
    
}


//////////////////////////////////////////////////////
public extension Observation {
    
    init(id: String = UUID().uuidString) {
        self.id = id
        self.resourceType = "Observation"
    }
}








/**
 🔥🔥🔥🔥🔥🔥🔥🔥🔥 NOT COMPLETE 🔥🔥🔥🔥🔥🔥🔥🔥🔥
 Component results.
 
 Some observations have multiple component observations.  These component observations are expressed as separate code
 value pairs that share the same attributes.  Examples include systolic and diastolic component observations for blood
 pressure measurement and multiple component observations for genetics observations.
 */
public struct ObservationComponent: Codable {

    /// Type of component observation (code / type).
    public var code: CodeableConcept?
    
    /// Why the component result is missing.
    public var dataAbsentReason: CodeableConcept?
    
    /// High, low, normal, etc..
    public var interpretation: [CodeableConcept]?
    
    /// Provides guide for interpretation of component result.
    public var referenceRange: [ObservationReferenceRange]?
    
    /// Actual component result.
    public var valueBoolean: Bool?
    
    /// Actual component result.
    public var valueCodeableConcept: CodeableConcept?
    
    /// Actual component result.
    public var valueDateTime: String?
    
    /// Actual component result.
    public var valueInteger: Int?
    
    /// Actual component result.
    public var valueQuantity: Quantity?
    
    /// Actual component result.
    public var valueRange: Range?
    
    /// Actual component result.
    public var valueString: String?

}



/**
 Provides guide for interpretation.
 
 Guidance on how to interpret the value by comparison to a normal or recommended range.  Multiple reference ranges are
 interpreted as an "OR".   In other words, to represent two distinct target populations, two `referenceRange` elements
 would be used.
 */
public struct ObservationReferenceRange: Codable {

    /// Applicable age range, if relevant.
    public var age: Range?
    
    /// Reference range population.
    public var appliesTo: [CodeableConcept]?
    
    /// High Range, if relevant.
    public var high: Quantity?
    
    /// Low Range, if relevant.
    public var low: Quantity?
    
    /// Text based reference range in an observation.
    public var text: String?
    
    /// Reference range qualifier.
    public var type: CodeableConcept?

}
