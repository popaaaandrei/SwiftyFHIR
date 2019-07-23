//
//  Concept+Mappings.swift
//  Pods-SwiftyFHIR_Tests
//
//  Created by Andrei on 23/07/2019.
//

import Foundation



public extension Concept {
    
    /// mappings between
    static let mappings: [Coding: Concept] = {
        var dictionary = [Coding: Concept]()
        
        Concept.allCases
            .filter({ $0.codeableConcept.coding != nil })
            .map({ ($0.codeableConcept.coding!, $0) })
            .forEach { (coding, concept) in
                coding.forEach({ dictionary[$0] = concept })
        }
        print("🌺🌺🌺🌺🌺🌺🌺🌺🌺🌺🌺🌺🌺🌺🌺🌺🌺🌺🌺🌺🌺🌺🌺🌺🌺🌺")
        return dictionary
    }()
    
}
