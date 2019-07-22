//
//  BodySite.swift
//  goclinic-ehr-iOS
//
//  Created by andrei on 28/06/2018.
//  Copyright © 2019 GoClinic B.V. All rights reserved.
//

import Foundation



public enum BodySite: String, Codable {
    
    
    case rightKnee = "210562007"
    case leftKnee = "210659002"
    case knee = "361291001"
    
    
    public var code: String {
        return rawValue
    }
    
    
    public var text: String {
        switch self {
        case .rightKnee: return "Right knee"
        case .leftKnee: return "Left knee"
        case .knee: return "Entire knee region"
        }
    }
    
    
    public var display: String {
        switch self {
        case .rightKnee: return "Entire right knee (body structure)"
        case .leftKnee: return "Entire left knee (body structure)"
        case .knee: return "Entire knee region (body structure)"
        }
    }
    
    
    public var codeableConcept: CodeableConcept {
        return Coding(code: code, display: display, system: Terminology.SNOMED.system)
            .asCodeableConcept
    }
    
    
    
}


