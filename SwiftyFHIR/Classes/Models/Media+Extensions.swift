//
//  Media+Extensions.swift
//  SwiftyFHIR
//
//  Created by Andrei on 22/07/2019.
//

import Foundation



public extension Media {
    
    
    #if canImport(UIKit)
    /// create Medias
    init(concept: Concept,
         patient: String,
         image: UIImage,
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
        
        // image size, frames
        let scale = CGAffineTransform(scaleX: UIScreen.main.scale, y: UIScreen.main.scale)
        let size = image.size.applying(scale)
        self.width = Int(size.width)
        self.height = Int(size.height)
        self.frames = 1
        
        // image itself
        self.content = image.asAttachment()
    }
    #endif
    
    
    
    /// validation method
    func validate() throws {
        try basicResourceValidation()
        
        // if we have date
        if let date = occurrenceDateTime {
            guard date.isFHIRDateTime() else {
                throw FHIRError.regex(input: date)
            }
            
            try date.asFHIRDateTime()
        }
    }
    
}


#if canImport(UIKit)
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
