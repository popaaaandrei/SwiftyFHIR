//
//  Media+UIKit.swift
//  SwiftyFHIR
//
//  Created by Andrei on 26/09/2019.
//

#if canImport(UIKit)
import UIKit



public extension UIImage {
    
    func asAttachment() throws -> Attachment {
        var attachment = Attachment()
        attachment.contentType = "image/jpeg"
        guard let imageString = jpegData(compressionQuality: 1.0)?.asStringBase64() else {
            throw FHIRError.conversion(message: "UIImage -> Data")
        }
        attachment.data = imageString
        attachment.creation = __RFC3339DateFormatter.string(from: Date())
        return attachment
    }
    
    /// image size
    var properties: (width: Int, height: Int) {
        
        let scale = CGAffineTransform(scaleX: UIScreen.main.scale, y: UIScreen.main.scale)
        let size = self.size.applying(scale)
        let width = Int(size.width)
        let height = Int(size.height)
        
        return (width: width, height: height)
    }
    
}



public extension Media {
    

    init(concept: Concept,
         patient: String,
         image: UIImage,
         bodySite: BodySite? = nil,
         device: String? = nil) throws {
        
        // image itself
        let imageAttachment = try image.asAttachment()
        
        self.init(concept: concept,
                  patient: patient,
                  imageAttachment: imageAttachment,
                  bodySite: bodySite,
                  device: device)
        
        let (width, height) = image.properties
        
        // image size
        self.width = width
        self.height = height
        // picture has one frame
        self.frames = 1
    }

}

#endif
