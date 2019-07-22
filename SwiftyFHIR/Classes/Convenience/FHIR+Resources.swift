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
    
    /*
    public func resource(bodySite: BodySite? = nil) -> ResourceType {
        switch self {
        ////////////////////////////////////////////
        case let .painScoreObservation(value):
            let observation = Observation.with(concept: .painScore)
            // result quantity
            observation.valueQuantity = MeasurementUnit.painScore(value: value).quantity
            // method concept
            observation.method = Method.VAS10.concept
            // body Site
            observation.bodySite = bodySite?.concept
            return observation
            
        case .painAcceptable:
            return Condition.with(concept: .painAcceptableLevel, confirmed: true)
        case .painHeavy:
            return Condition.with(concept: .painHeavy, confirmed: true, bodySite: bodySite)
            
        ////////////////////////////////////////////
        case let .bodyTemperatureObservation(value):
            let observation = Observation.with(concept: .bodyTemperature)
            // ZIBs link
            observation.addMeta(profileUrl: "http://nictiz.nl/fhir/StructureDefinition/zib-BodyTemperature")
            // result quantity
            observation.valueQuantity = MeasurementUnit.degreesCelsius(value: value).quantity
            return observation
            
        case .bodyFever:
            return Condition.with(concept: .fever, confirmed: true)

            
        ////////////////
        case .woundSwelling:
            return Condition.with(concept: .localizedSwelling, confirmed: true, bodySite: bodySite)
        case .woundSurgicalLeaking:
            return Condition.with(concept: .woundSurgicalLeaking, confirmed: true, bodySite: bodySite)
        case .woundRed:
            return Condition.with(concept: .woundRed, confirmed: true, bodySite: bodySite)
        case .woundHealing:
            return Condition.with(concept: .woundHealing, confirmed: true, bodySite: bodySite)
        case let .woundPicture(image):
            return Media.with(concept: .woundPhotography, image: image, bodySite: bodySite)
        }
    }
    */
    
}




