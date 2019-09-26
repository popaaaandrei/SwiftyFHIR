//
//  FHIR+Resources.swift
//  goclinic-ehr-iOS
//
//  Created by Andrei on 20/05/2019.
//  Copyright © 2019 GoClinic B.V. All rights reserved.
//

import Foundation



public enum 🔥 {
    
    /// general
    case bodyTemperatureObservation(value: Double)
    case bodyFever
    
    /// pain
    case painScoreObservation(value: Int)
    case painAcceptable
    case painHeavy
    
    // wound
    case woundSwelling
    case woundSurgicalLeaking
    case woundRed
    case woundHealing
    
    #if canImport(UIKit)
    case woundPicture(image: UIImage)
    #endif
    
    
    
    public func resource(patient: String,
                         bodySite: BodySite? = nil,
                         device: String? = nil) throws -> ResourceType {
        
        switch self {

        case let .painScoreObservation(value):
            var observation = Observation(concept: .painScore, patient: patient, bodySite: bodySite)
            observation.valueQuantity = MeasurementUnit.painScore(value: value).quantity
            observation.method = Method.VAS10.concept
            return observation
            
        case .painAcceptable:
            return Condition(concept: .painAcceptableLevel, patient: patient, verification: .confirmed, bodySite: bodySite)
            
        case .painHeavy:
            return Condition(concept: .painHeavy, patient: patient, verification: .confirmed, bodySite: bodySite)
            
        case let .bodyTemperatureObservation(value):
            var observation = Observation(concept: .bodyTemperature, patient: patient)
            observation.valueQuantity = MeasurementUnit.degreesCelsius(value: value).quantity
            return observation
            
        case .bodyFever:
            return Condition(concept: .fever, patient: patient, verification: .confirmed)

        case .woundSwelling:
            return Condition(concept: .localizedSwelling, patient: patient, verification: .confirmed, bodySite: bodySite)
    
        case .woundSurgicalLeaking:
            return Condition(concept: .woundSurgicalLeaking, patient: patient, verification: .confirmed, bodySite: bodySite)
        case .woundRed:
            return Condition(concept: .woundRed, patient: patient, verification: .confirmed, bodySite: bodySite)
            
        case .woundHealing:
            return Condition(concept: .woundHealing, patient: patient, verification: .confirmed, bodySite: bodySite)
        
        #if canImport(UIKit)
        case let .woundPicture(image):
            return try Media(concept: .woundPhotography, patient: patient, image: image, bodySite: bodySite, device: device)
        #endif
        }
    }
 
    
}




