//
//  Media+Extensions.swift
//  SwiftyFHIR
//
//  Created by Andrei on 22/07/2019.
//

import Foundation



public extension Media {
    
    
    /// create Medias
    init(concept: Concept,
         patient: String,
         imageAttachment: Attachment,
         bodySite: BodySite? = nil,
         device: String? = nil) {
        
        // new Media with random id
        self = Media(id: concept.rawValue + "-" + UUID().uuidString)
        
        // photo
        self.type = DigitalMediaType.photo
        // photo of what
        self.subtype = concept.codeableConcept
        
        // patient
        self.subject = Reference(reference: "Patient/\(patient)")
        
        // the time is now
        self.occurrenceDateTime = __RFC3339DateFormatter.string(from: Date())
        
        // device name
        if let device = device {
            self.device = Reference(display: device)
        }
    
        // body site
        if let bodySite = bodySite?.codeableConcept {
            self.bodySite = bodySite
        }
        
        // image itself
        self.content = imageAttachment
    }
    
    
    
    
    /// validation method
    func validate() throws -> Media {
        
        // if we have date
        if let date = occurrenceDateTime {
            guard date.isFHIRDateTime() else {
                throw FHIRError.regex(input: date)
            }
            
            try date.asFHIRDateTime()
        }
        
        return try basicResourceValidation()
    }
    
}



