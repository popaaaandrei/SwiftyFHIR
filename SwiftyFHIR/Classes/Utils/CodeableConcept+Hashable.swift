//
//  CodeableConcept+Hashable.swift
//  goclinic-ehr-iOS
//
//  Created by Andrei on 18/05/2019.
//  Copyright © 2019 GoClinic B.V. All rights reserved.
//

import Foundation




extension Coding: Hashable, Equatable {
    
    public static func == (lhs: Coding, rhs: Coding) -> Bool {
        return (lhs.code == rhs.code) && (lhs.system == rhs.system)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(code)
        hasher.combine(system)
    }
}





extension CodeableConcept: Equatable {
    
    public static func == (lhs: CodeableConcept, rhs: CodeableConcept) -> Bool {
        guard let codingLeft = lhs.coding, let codingRight = rhs.coding else { return false }
        
        // compare exhaustively left and right arrays, if there is a common element
        if Set(codingLeft).intersection(Set(codingRight)).count > 0 {
            return true
        }
        
        return false
    }
    
    
}



