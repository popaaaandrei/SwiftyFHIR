//
//  Quantity.swift
//  App
//
//  Created by Andrei on 15/07/2019.
//

import Foundation



public struct Quantity: Codable {
    
    /// Coded form of the unit.
    public var code: String?
    
    /// How the value should be understood and represented - whether the actual value is greater or less than the stated
    /// value due to measurement issues; e.g. if the comparator is "<" , then the real value is < stated value.
    public var comparator: String?
    
    /// System that defines coded unit form.
    public var system: String?
    
    /// Unit representation.
    public var unit: String?
    
    /// Numerical value (with implicit precision).
    public var value: Double?
    
    
    
    public init(code: String? = nil,
                comparator: String? = nil,
                system: String? = nil,
                unit: String? = nil,
                value: Double? = nil) {
        self.code = code
        self.comparator = comparator
        self.system = system
        self.unit = unit
        self.value = value
    }

}
