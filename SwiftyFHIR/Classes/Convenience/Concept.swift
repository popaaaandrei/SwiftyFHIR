//
//  Concept.swift
//  goclinic-ehr-iOS
//
//  Created by Andrei on 19/09/2018.
//  Copyright © 2019 GoClinic B.V. All rights reserved.
//

import Foundation




public enum Concept: String, CaseIterable, CustomStringConvertible {
    
    
    // helpers
    case problem
    case photo
    
    // general
    case takingMedication
    case fever
    case bodyTemperature
    
    // cardiology
    case bloodPressure
    case systolicBloodPressure
    case diastolicBloodPressure
    case heartRate
    
    // pain
    case painAcceptableLevel
    case painHeavy
    case painScore
    
    // wound
    case localizedSwelling
    case woundSurgicalLeaking
    case woundRed
    case woundPhotography
    case woundHealing

    
    
    
    public var text: String {
        switch self {
            
        case .problem: return "Problem"
        case .photo: return "Photo"
            
        case .bloodPressure: return "Blood pressure panel"
        case .systolicBloodPressure: return "Systolic blood pressure"
        case .diastolicBloodPressure: return "Diastolic blood pressure"
        case .heartRate: return "Heart rate"
            
        case .painAcceptableLevel: return "Acceptable pain level"
        case .painScore: return "Pain score"
        case .painHeavy: return "Heavy pain"
        
        case .bodyTemperature: return "Body temperature"
        case .fever: return "Fever"
        case .localizedSwelling: return "Localized swelling"
        case .takingMedication: return "Taking medication"
        case .woundSurgicalLeaking: return "Surgical wound, leaking"
        case .woundRed: return "Wound red"
        case .woundPhotography: return "Photography of wound"
        case .woundHealing: return "Wound healing"
        }
    }
    
    
    public var ZIBprofile: String? {
        switch self {
        case .problem:
            return "http://nictiz.nl/fhir/StructureDefinition/zib-Problem"
        case .bodyTemperature:
            return "http://nictiz.nl/fhir/StructureDefinition/zib-BodyTemperature"
        default:
            return nil
        }
    }

    
    /// components of the codeable concept
    public var codeableConcept: CodeableConcept {
        switch self {
            
        case .problem:
            // snomed code
            let snomed = Coding(code: "55607006",
                                display: text,
                                system: Terminology.SNOMED.system)
            // HL7 terminology
            let other = Coding(code: "problem-list-item",
                               display: "Problem List Item",
                               system: "http://terminology.hl7.org/CodeSystem/condition-category")
            return [snomed, other].asCodeableConcept

            
        case .fever:
            // snomed
            return Coding(code: "386661006",
                          display: text,
                          system: Terminology.SNOMED.system).asCodeableConcept
            
        case .bodyTemperature:
            // loinc code
            let loinc = Coding(code: "8310-5",
                               display: text,
                               system: Terminology.Loinc.system)
            // snomed
            let snomed = Coding(code: "386725007",
                                display: text,
                                system: Terminology.SNOMED.system)
            return [loinc, snomed].asCodeableConcept
            
        case .photo:
            // HL7 terminology
            return DigitalMediaType.photo.concept
            
        case .localizedSwelling:
            // snomed
            return Coding(code: "722192005",
                          display: text,
                          system: Terminology.SNOMED.system).asCodeableConcept
            
        case .takingMedication:
            // snomed
            return Coding(code: "129019007",
                          display: text,
                          system: Terminology.SNOMED.system).asCodeableConcept
            
        case .woundSurgicalLeaking:
            // snomed
            return Coding(code: "421044003",
                          display: text,
                          system: Terminology.SNOMED.system).asCodeableConcept
            
        case .woundRed:
            // snomed
            return Coding(code: "239163008",
                          display: text,
                          system: Terminology.SNOMED.system).asCodeableConcept
            
        case .woundPhotography:
            // snomed
            return Coding(code: "446080005",
                          display: text,
                          system: Terminology.SNOMED.system).asCodeableConcept
            
        case .woundHealing:
            // snomed
            return Coding(code: "298005009",
                          display: text,
                          system: Terminology.SNOMED.system).asCodeableConcept
            
        case .bloodPressure:
            // loinc code
            return Coding(code: "85354-9",
                          display: text,
                          system: Terminology.Loinc.system).asCodeableConcept
            
        case .systolicBloodPressure:
            // snomed code
            let snomed = Coding(code: "271649006",
                                display: text,
                                system: Terminology.SNOMED.system)
            // loinc code
            let loinc = Coding(code: "8480-6",
                               display: text,
                               system: Terminology.Loinc.system)
            return [snomed, loinc].asCodeableConcept
            
        case .diastolicBloodPressure:
            // loinc code
            return Coding(code: "8462-4",
                          display: text,
                          system: Terminology.Loinc.system).asCodeableConcept
            
        case .heartRate:
            // loinc code
            return Coding(code: "8867-4",
                          display: text,
                          system: Terminology.Loinc.system).asCodeableConcept
            
        case .painHeavy:
            // snomed
            return Coding(code: "279095003",
                          display: text,
                          system: Terminology.SNOMED.system).asCodeableConcept
            

        case .painAcceptableLevel:
            // snomed
            return Coding(code: "425976001",
                          display: text,
                          system: Terminology.SNOMED.system).asCodeableConcept
            
        case .painScore:
            // loinc code
            return Coding(code: "225908003",
                          display: text,
                          system: Terminology.Loinc.system).asCodeableConcept

        }
    }
    
    
    
    public var description: String {
        if let coding = codeableConcept.coding {
            var description = "["
            for code in coding where code.code != nil {
                description += "'\(code.code!)':'\(String(describing: code.display))',"
            }
            return description + "]"
        }
        return "[]"
    }
    
}
