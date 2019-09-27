//
//  SubjectIdentifiable.swift
//  SwiftyFHIR
//
//  Created by Andrei on 27/09/2019.
//

import Foundation



public protocol SubjectIdentifiable {
    
    /// Who and/or what this is about.
    var subject: Reference? { get set }
    
}
