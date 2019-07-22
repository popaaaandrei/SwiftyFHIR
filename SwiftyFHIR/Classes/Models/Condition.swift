//
//  Condition.swift
//  App
//
//  Created by Andrei on 21/07/2019.
//

import Foundation


/**
 🔥🔥🔥🔥🔥🔥🔥🔥🔥 NOT COMPLETE 🔥🔥🔥🔥🔥🔥🔥🔥🔥
 Detailed information about conditions, problems or diagnoses.
 A clinical condition, problem, diagnosis, or other event, situation, issue, or clinical concept that has risen to a level of concern.
 */
public struct Condition: Codable, ResourceType {
    
    
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
    /// Estimated or actual date,  date-time, or age.
    public var onsetDateTime: String?
    /// =================================================
    
    /// Identification of the condition, problem or diagnosis.
    public var code: CodeableConcept?
    
    /// problem-list-item | encounter-diagnosis.
    public var category: [CodeableConcept]?

    /// active | recurrence | inactive | remission | resolved.
    public var clinicalStatus: ConditionClinicalStatus?
    
    /// Anatomical location, if relevant.
    public var bodySite: [CodeableConcept]?
    
    /// Who has the condition?.
    public var subject: Reference?
    
    /// Person who asserts this condition.
    public var asserter: Reference?
    
    /// Encounter or episode when condition first asserted.
    public var context: Reference?
    
    /// The verification status to support the clinical status of the condition.
    public var verificationStatus: ConditionVerificationStatus?

}



//////////////////////////////////////////////////////
extension Condition {
    
    public init(id: String = UUID().uuidString) {
        self.id = id
        self.resourceType = "Condition"
    }
}
