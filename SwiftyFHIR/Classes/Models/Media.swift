//
//  Media.swift
//  App
//
//  Created by Andrei on 21/07/2019.
//

import Foundation



/**
 A photo, video, or audio recording acquired or used in healthcare. The actual content may be inline or provided by direct reference.
 */
public struct Media: ResourceType, SubjectIdentifiable {
    
    
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
    /// When Media was collected.
    public var occurrenceDateTime: String?
    /// =================================================
    
    /// Whether the media is a photo (still image), an audio recording, or a video recording.
    public var type: DigitalMediaType?
    
    /// The type of acquisition equipment/process.
    public var subtype: CodeableConcept?
    
    /// Imaging view, e.g. Lateral or Antero-posterior.
    public var view: CodeableConcept?
    
    /// Observed body part.
    public var bodySite: CodeableConcept?
    
    /// Why was event performed?.
    public var reasonCode: [CodeableConcept]?
    
    /// Actual Media - reference or data.
    public var content: Attachment?
    
    /// Who/What this Media is a record of.
    public var subject: Reference?
    
    /// Observing Device.
    public var device: Reference?
    
    /// Length in seconds (audio / video).
    public var duration: Int?
    
    /// Number of frames if > 1 (photo).
    public var frames: Int?
    
    /// Height of the image in pixels (photo/video).
    public var height: Int?
    
    /// Width of the image in pixels (photo/video).
    public var width: Int?


}


//////////////////////////////////////////////////////
public extension Media {
    
    init(id: String = UUID().uuidString) {
        self.id = id
        self.resourceType = "Media"
    }
}
