//
//  Patient+Extensions.swift
//  SwiftyFHIR
//
//  Created by Andrei on 22/03/2020.
//

import Foundation


public extension Patient {
    
    
    /// validation method
    @discardableResult
    func validate() throws -> Patient {

        // if we have date
        if let date = birthDate {
            guard date.isFHIRDateTime() else {
                throw FHIRError.regex(input: date)
            }

            try date.asFHIRDateTime()
        }
        
        return try basicResourceValidation()
    }
    
}


////////////////////////////////////////////////////////
public extension Patient {

    init(id: String = UUID().uuidString) {
        self.id = id
        self.resourceType = String(describing: Self.self)
    }

}
