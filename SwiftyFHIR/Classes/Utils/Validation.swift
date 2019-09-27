//
//  Validation.swift
//  App
//
//  Created by Andrei on 15/07/2019.
//

import Foundation



public extension ResourceType {
    
    /// validation for the basic Resource properties
    func basicResourceValidation() throws -> Self {
        guard resourceType == "\(Self.self)" else {
            throw FHIRError.validation(message: "improper resourceType - \(resourceType)")
        }
        guard !id.isEmpty else {
            throw FHIRError.noId
        }
        
        /// resources that have Subject property need to have a proper "Patient/" reference
        if let identifiable = self as? SubjectIdentifiable {
            guard let reference = identifiable.subject?.reference, reference.hasPrefix("Patient/") else {
                throw FHIRError.noPatientReference
            }
        }
        
        return self
    }
    
    /// default implementation for validation method
    func validate() throws -> Self {
        return try basicResourceValidation()
    }
    
}





extension String {
    
    /***
     A date, date-time or partial date (e.g. just year or year + month) as used in human communication. The format is YYYY, YYYY-MM, YYYY-MM-DD or YYYY-MM-DDThh:mm:ss+zz:zz, e.g. 2018, 1973-06, 1905-08-23, 2015-02-07T13:28:17-05:00 or 2017-01-01T00:00:00.000Z. If hours and minutes are specified, a time zone SHALL be populated. Seconds must be provided due to schema type constraints but may be zero-filled and may be ignored at receiver discretion. Dates SHALL be valid dates. The time "24:00" is not allowed. Leap Seconds are allowed - see below    union of xs:dateTime, xs:date, xs:gYearMonth, xs:gYear    A JSON string - a union of xs:dateTime, xs:date, xs:gYearMonth, xs:gYear
     - Regex: ([0-9]([0-9]([0-9][1-9]|[1-9]0)|[1-9]00)|[1-9]000)(-(0[1-9]|1[0-2])(-(0[1-9]|[1-2][0-9]|3[0-1])(T([01][0-9]|2[0-3]):[0-5][0-9]:([0-5][0-9]|60)(\.[0-9]+)?(Z|(\+|-)((0[0-9]|1[0-3]):[0-5][0-9]|14:00)))?)?)?
     ***/
    func isFHIRDateTime() -> Bool {
        let regex = #"([0-9]([0-9]([0-9][1-9]|[1-9]0)|[1-9]00)|[1-9]000)(-(0[1-9]|1[0-2])(-(0[1-9]|[1-2][0-9]|3[0-1])(T([01][0-9]|2[0-3]):[0-5][0-9]:([0-5][0-9]|60)(\.[0-9]+)?(Z|(\+|-)((0[0-9]|1[0-3]):[0-5][0-9]|14:00)))?)?)?"#
        
        guard range(of: regex, options: .regularExpression) != nil else {
            return false
        }
        return true
    }
    
    
    /***
     An instant in time in the format YYYY-MM-DDThh:mm:ss.sss+zz:zz (e.g. 2015-02-07T13:28:17.239+02:00 or 2017-01-01T00:00:00Z). The time SHALL specified at least to the second and SHALL include a time zone. Note: This is intended for when precisely observed times are required (typically system logs etc.), and not human-reported times - for those, use date or dateTime (which can be as precise as instant, but is not required to be). instant is a more constrained dateTime    xs:dateTime    A JSON string - an xs:dateTime
     - Note: This type is for system times, not human times (see date and dateTime below).
     - Regex: ([0-9]([0-9]([0-9][1-9]|[1-9]0)|[1-9]00)|[1-9]000)-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])T([01][0-9]|2[0-3]):[0-5][0-9]:([0-5][0-9]|60)(\.[0-9]+)?(Z|(\+|-)((0[0-9]|1[0-3]):[0-5][0-9]|14:00))
     ***/
    func isFHIRInstant() -> Bool {
        let regex = #"([0-9]([0-9]([0-9][1-9]|[1-9]0)|[1-9]00)|[1-9]000)-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])T([01][0-9]|2[0-3]):[0-5][0-9]:([0-5][0-9]|60)(\.[0-9]+)?(Z|(\+|-)((0[0-9]|1[0-3]):[0-5][0-9]|14:00))"#
        
        guard range(of: regex, options: .regularExpression) != nil else {
            return false
        }
        return true
    }
    
    
    @discardableResult
    func asFHIRDateTime() throws -> Date {
        if let date = __ISO8601DateFormatter.date(from: self) {
            return date
        }
        
        if let date = __RFC3339DateFormatter.date(from: self) {
            return date
        }

        if let date = __ISO8601FractionalDateFormatter.date(from: self ) {
            return date
        }

        if let date = __YYYYDateFormatter.date(from: self) {
            return date
        }

        if let date = __YYYYMMDateFormatter.date(from: self) {
            return date
        }

        if let date = __YYYMMDDDateFormatter.date(from: self) {
            return date
        }

        throw FHIRError.date(date: self)
    }
    
}




