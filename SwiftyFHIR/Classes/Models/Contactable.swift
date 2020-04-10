//
//  Contactable.swift
//  SwiftyFHIR
//
//  Created by Andrei on 10/04/2020.
//

import Foundation



extension Organization : Contactable {}
extension Patient : Contactable {}
extension Practitioner : Contactable {}



public protocol Contactable {
    /// A contact detail
    var telecom: [ContactPoint]? { get set }
}



public extension Contactable where Self : ResourceType {
    
    func get(contact: ContactPointSystem) -> String? {
        return telecom?.first(where: {$0.system == .phone})?.value
    }
    
    mutating func set(contact system: ContactPointSystem, value: String) {
        let contactPoint = ContactPoint(value: value, system: system)
        /// if other identifiers exist
        if let _ = telecom {
            /// append
            self.telecom?.append(contactPoint)
            
        /// doesn't exist -> create
        } else { self.telecom = [contactPoint] }
    }
    
    /// phone number
    var __phone: String? {
        get {
            get(contact: .phone)
        }
        set {
            guard let newValue = newValue else { return }
            set(contact: .phone, value: newValue)
        }
    }
    
    /// email address
    var __email: String? {
        get {
            get(contact: .email)
        }
        set {
            guard let newValue = newValue else { return }
            set(contact: .email, value: newValue)
        }
    }
    
}
