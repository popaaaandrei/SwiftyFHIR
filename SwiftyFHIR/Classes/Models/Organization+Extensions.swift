//
//  Organization+Extensions.swift
//  SwiftyFHIR
//
//  Created by Andrei on 02/04/2020.
//

import Foundation



////////////////////////////////////////////////////////
public extension Organization {

    /// default initializer
    init(id: String = UUID().uuidString) {
        self.id = id
        self.resourceType = String(describing: Self.self)
    }
    
    
    init(name: String? = nil,
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
        self.name = name
        
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
                                postalCode: postalCode,
                                use: .work)]
    }
    
    
    /// extract address
    var __address: String? {
        guard let address = address?.first else { return nil }
        return String(describing: address)
    }

}
