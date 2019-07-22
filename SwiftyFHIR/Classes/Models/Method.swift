//
//  Method.swift
//  goclinic-ehr-iOS
//
//  Created by Andrei on 16/10/2018.
//  Copyright © 2019 GoClinic B.V. All rights reserved.
//

import Foundation



public enum Method {
    
    
    case VAS10
    case VAS100
    
    
    
    public var concept: CodeableConcept {
        switch self {
        case .VAS10:
            return Coding(code: "VAS10", display: "VAS10", system: Terminology.PijnMeetmethode.system).asCodeableConcept
            
        case .VAS100:
            return Coding(code: "VAS100", display: "VAS100", system: Terminology.PijnMeetmethode.system).asCodeableConcept
        }
    }
    
    
}

