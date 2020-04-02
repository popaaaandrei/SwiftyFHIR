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

    /// default initializer
    init(id: String = UUID().uuidString) {
        self.id = id
        self.resourceType = String(describing: Self.self)
    }

    
    init(firstName: String? = nil,
         lastName: String? = nil,
         birthday: String? = nil,
         // address
         city: String? = nil,
         country: String? = nil,
         street: String? = nil,
         postalCode: String? = nil,
         // contact
         phone: String? = nil,
         email: String? = nil) {
        
        self.init()
        self.active = true
        
        /// name
        self.name = [HumanName(first: firstName, last: lastName)]
        
        /// phone
        var contactPoints = [ContactPoint]()
        if let phone = phone {
            contactPoints.append(ContactPoint(value: phone, system: .phone))
        }
        /// email
        if let email = email {
            contactPoints.append(ContactPoint(value: email, system: .email))
        }
        /// contacts
        if !contactPoints.isEmpty {
            self.telecom = contactPoints
        }
        
        /// address
        self.address = [Address(city: city,
                                country: country,
                                street: street,
                                postalCode: postalCode)]
        /// birthday
        self.birthDate = birthday
    }
    

}


