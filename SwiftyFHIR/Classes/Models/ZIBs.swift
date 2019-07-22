//
//  ZIBs.swift
//  SwiftyFHIR
//
//  Created by Andrei on 21/07/2019.
//

import Foundation


/**
 Zorginformatiebouwstenen worden gebruikt om inhoudelijke (niet technische) afspraken vast te leggen ten behoeve van het standaardiseren van informatie, die gebruikt wordt in het zorgproces.
 */
public enum ZIBs: String {
    
    
    //
    case problem
    
    
    
    var profile: String {
        switch self {
        case .problem: return "http://nictiz.nl/fhir/StructureDefinition/zib-Problem"
        }
    }
    
    
    var meta: Meta {
        switch self {
        default:
            return Meta(profile: profile)
        }
    }
    
    
}
