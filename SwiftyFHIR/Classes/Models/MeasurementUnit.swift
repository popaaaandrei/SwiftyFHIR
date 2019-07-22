//
//  MeasurementUnit.swift
//  goclinic-ehr-iOS
//
//  Created by Andrei on 19/09/2018.
//  Copyright © 2019 GoClinic B.V. All rights reserved.
//

import Foundation



public enum MeasurementUnit {
    
    
    case bloodPressure(value: Int)
    case heartRate(value: Int)
    case painScore(value: Int)
    case degreesCelsius(value: Double)
    
    
    
    public var quantity: Quantity {
        switch self {
        case .bloodPressure(let value):
            return Quantity(code: "mm[Hg]",
                            system: Terminology.UCUM.system,
                            unit: "mmHg",
                            value: Double(value))
        
        case .heartRate(let value):
            return Quantity(code: "/min",
                            system: Terminology.UCUM.system,
                            unit: "beats/minute",
                            value: Double(value))
            
        case .painScore(let value):
            return Quantity(code: "{score}",
                            system: Terminology.UCUM.system,
                            unit: "{score}",
                            value: Double(value))
            
        case .degreesCelsius(let value):
            return Quantity(code: "Cel",
                            system: Terminology.UCUM.system,
                            unit: "C",
                            value: Double(value))
        }
    }


}
