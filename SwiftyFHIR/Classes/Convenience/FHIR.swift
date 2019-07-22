//
//  FHIR.swift
//  goclinic-ehr-iOS
//
//  Created by andrei on 21/06/2018.
//  Copyright © 2019 GoClinic B.V. All rights reserved.
//

import Foundation




// ============================================================================
// MARK: create Observations
// ============================================================================
public extension Observation {
    
    
    init(concept: Concept,
         patient: String,
         bodySite: BodySite? = nil) {
        
        // new Observation with random id
        self = Observation(id: concept.rawValue + "-" + UUID().uuidString)

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
    
}


// ============================================================================
// MARK: create Conditions
// ============================================================================
public extension Condition {
    
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
        self.meta = ZIBs.problem.meta
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
    
}



// ============================================================================
// MARK: create Medias
// ============================================================================
#if canImport(UIKit)
public extension Media {

    init(concept: Concept,
         patient: String,
         image: UIImage,
         bodySite: BodySite? = nil,
         device: String) {
        
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
        self.device = Reference(display: device)
    
        // body site
        if let bodySite = bodySite?.codeableConcept {
            self.bodySite = bodySite
        }
        
        // image size, frames
        let scale = CGAffineTransform(scaleX: UIScreen.main.scale, y: UIScreen.main.scale)
        let size = image.size.applying(scale)
        self.width = Int(size.width)
        self.height = Int(size.height)
        self.frames = 1
        
        // image itself
        self.content = image.asAttachment()
    }

}

public extension UIImage {
    
    func asAttachment() -> Attachment {
        var attachment = Attachment()
        attachment.contentType = "image/jpeg"
        if let imageString = jpegData(compressionQuality: 1.0)?.asStringBase64() {
            attachment.data = imageString
        }
        attachment.creation = __RFC3339DateFormatter.string(from: Date())
        return attachment
    }
    
}
#endif
