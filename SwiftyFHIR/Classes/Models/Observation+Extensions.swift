//
//  Observation+Extensions.swift
//  Pods-SwiftyFHIR_Tests
//
//  Created by Andrei on 22/07/2019.
//

import Foundation


public extension Observation {
    
    /// create Observations
    init(concept: Concept,
         patient: String,
         bodySite: BodySite? = nil) {
        
        // new Observation with random id
        self = Observation(id: concept.rawValue + "-" + UUID().uuidString)
        // add meta information from the concept profile
        if let profile = concept.ZIBprofile {
            self.meta = Meta(profile: profile)
        }
        
        // status is final
        self.status = ObservationStatus.final
        // the time is now
        self.effectiveDateTime = __RFC3339DateFormatter.string(from: Date())
        // patient reference
        self.subject = Reference(reference: "Patient/\(patient)")
        // concept
        self.code = concept.codeableConcept
        
        // who is responsible for the observation
        let performer = Reference(display: "Patient self-assessment with phone app.",
                                  reference: "Patient phone")
        self.performer = [performer]
        
        // body site
        if let bodySite = bodySite?.codeableConcept {
            self.bodySite = bodySite
        }
    }
    

    
    /// extract quantity if present
    var __valueQuantity: String? {
        if let component = component?.first {
            return component.valueQuantity?.value?.description
        }
        
        return valueQuantity?.value?.description
    }
    
    
    /// validation method
    func validate() throws {
        try basicResourceValidation()
        
        // if we have date
        if let date = issued {
            guard date.isFHIRInstant() else {
                throw FHIRError.regex(input: date)
            }
        }
        
        // if we have date
        if let date = effectiveDateTime {
            guard date.isFHIRDateTime() else {
                throw FHIRError.regex(input: date)
            }
            
            try date.asFHIRDateTime()
        }
    }
    
}
