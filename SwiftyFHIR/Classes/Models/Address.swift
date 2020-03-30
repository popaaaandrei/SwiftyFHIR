//
//  Address.swift
//  SwiftyFHIR
//
//  Created by Andrei on 22/03/2020.
//

import Foundation



/**
An address expressed using postal conventions (as opposed to GPS or other location definition formats). This data type may be used to convey addresses for use in delivering mail as well as for visiting locations which might not be valid for mail delivery. There are a variety of postal address formats defined around the world.
*/
public struct Address: Codable {
    
    /// Name of city, town etc..
    public var city: String?
    
    /// Country (e.g. can be ISO 3166 2 or 3 letter code).
    public var country: String?
    
    /// District name (aka county).
    public var district: String?
    
    /// Street name, number, direction & P.O. Box etc..
    public var line: [String]?
    
    /// Time period when address was/is in use.
    public var period: Period?
    
    /// Postal code for area.
    public var postalCode: String?
    
    /// Sub-unit of country (abbreviations ok).
    public var state: String?
    
    /// Text representation of the address.
    public var text: String?
    
    /// Distinguishes between physical addresses (those you can visit) and mailing addresses (e.g. PO Boxes and care-of
    /// addresses). Most addresses are both.
    public var type: AddressType?
    
    /// The purpose of this address.
    public var use: AddressUse?

}


public extension Address {
    
    /// default initializer
    init(city: String? = nil,
         country: String? = nil,
         district: String? = nil,
         line: [String]? = nil,
         postalCode: String? = nil,
         state: String? = nil,
         type: AddressType? = .physical,
         use: AddressUse? = .home) {
        
        self.city = city
        self.country = country
        self.district = district
        self.line = line
        self.postalCode = postalCode
        self.state = state
        self.type = type
        self.use = use
    }
    
}
