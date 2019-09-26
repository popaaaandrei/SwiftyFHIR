//
//  Condition+Extensions.swift
//  SwiftyFHIR
//
//  Created by Andrei on 22/07/2019.
//

import Foundation



public extension Condition {
    
    
    /// create Condition
    init(concept: Concept,
         patient: String,
         verification: ConditionVerificationStatus = .confirmed,
         bodySite: BodySite? = nil) {
        
        // new Condition with random id
        self = Condition(id: concept.rawValue + "-" + UUID().uuidString)
        // active, verified or not
        self.clinicalStatus = ConditionClinicalStatus.active
        self.verificationStatus = verification
        
        // link to the ZIB
        self.meta = Concept.problem.ZIBprofile?.profileMeta
        // category
        self.category = [Concept.problem.codeableConcept]
        // patient reference
        self.subject = Reference(reference: "Patient/\(patient)")
        
        // the time is now
        self.onsetDateTime = __RFC3339DateFormatter.string(from: Date())
        // pain score concept
        self.code = concept.codeableConcept
        
        // body site
        if let bodySite = bodySite?.codeableConcept {
            self.bodySite = [bodySite]
        }
    }
    
    
    
    
    /// validation method
    func validate() throws -> Condition {
        
        // if we have date
        if let date = onsetDateTime {
            guard date.isFHIRDateTime() else {
                throw FHIRError.regex(input: date)
            }
            
            try date.asFHIRDateTime()
        }
        
        return try basicResourceValidation()
    }
    
}
