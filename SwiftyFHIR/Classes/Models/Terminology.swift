//
//  Terminology.swift
//  goclinic-ehr-iOS
//
//  Created by Andrei on 19/09/2018.
//  Copyright © 2019 GoClinic B.V. All rights reserved.
//

import Foundation




public enum Terminology {
    
    case SNOMED
    case ICD10
    case Loinc
    case UCUM
    case PijnMeetmethode
    case ConditionVerificationStatus
    case ConditionClinicalStatus
    case DigitalMediaType
    
    
    public var oid: String {
        switch self {
        case .SNOMED: return "2.16.840.1.113883.6.96"
        case .ICD10:  return "2.16.840.1.113883.6.3"
        case .Loinc:  return "2.16.840.1.113883.6.1"
        case .UCUM:   return "2.16.840.1.113883.4.642.3.831"
        case .PijnMeetmethode: return "2.16.840.1.113883.2.4.3.11.60.40.4.9.1"
        case .ConditionVerificationStatus: return "2.16.840.1.113883.4.642.3.166"
        case .ConditionClinicalStatus: return "2.16.840.1.113883.4.642.3.155"
        case .DigitalMediaType: return "2.16.840.1.113883.4.642.1.326"
        }
    }
    
    
    public var display: String? {
        switch self {
        case .SNOMED: return "SNOMED Clinical Terms"
        case .ICD10:  return "ICD-10 - International Classification of Diseases"
        case .Loinc:  return "LOINC - Logical Observation Identifier Names and Codes"
        case .UCUM:   return "UCUM - Unified Code for Units of Measure"
        case .PijnMeetmethode: return "PijnMeetmethode"
        case .ConditionVerificationStatus: return "ConditionVerificationStatus"
        case .ConditionClinicalStatus: return "ConditionClinicalStatus"
        case .DigitalMediaType: return "DigitalMediaType"
        }
    }
    
    
    public var system: String {
        switch self {
        case .SNOMED: return "http://snomed.info/sct"
        case .ICD10:  return "http://hl7.org/fhir/sid/icd-10"
        case .Loinc:  return "http://loinc.org"
        case .UCUM:   return "http://unitsofmeasure.org"
        case .PijnMeetmethode:
            return oid
        case .ConditionVerificationStatus:
            return "http://terminology.hl7.org/CodeSystem/condition-ver-status"
        case .ConditionClinicalStatus:
            return "http://hl7.org/fhir/condition-clinical"
        case .DigitalMediaType:
            return "http://hl7.org/fhir/digital-media-type"
        }
    }
    

}
