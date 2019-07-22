//
//  Attachment.swift
//  App
//
//  Created by Andrei on 21/07/2019.
//

import Foundation



/**
 Content in a format defined elsewhere.
 
 For referring to data content defined in other formats.
 */
public struct Attachment: Codable {
    
    /// Mime type of the content, with charset etc..
    public var contentType: String?
    
    /// Date attachment was first created.
    public var creation: String?
    
    /// Data inline, base64ed.
    public var data: String?
    
    /// Hash of the data (sha-1, base64ed).
    public var hash: String?
    
    /// Human language of the content (BCP-47).
    public var language: String?
    
    /// Number of bytes of content (if url provided).
    public var size: Int?
    
    /// Label to display in place of the data.
    public var title: String?
    
    /// Uri where the data can be found.
    public var url: String?
    
    
    public init(contentType: String? = nil,
                creation: String? = nil,
                data: String? = nil,
                hash: String? = nil,
                language: String? = nil,
                size: Int? = nil,
                title: String? = nil,
                url: String? = nil) {
        
        self.contentType = contentType
        self.creation = creation
        self.data = data
        self.hash = hash
        self.language = language
        self.size = size
        self.title = title
        self.url = url
        
    }


}
