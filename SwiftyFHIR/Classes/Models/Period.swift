//
//  Period.swift
//  SwiftyFHIR
//
//  Created by Andrei on 22/03/2020.
//

import Foundation



/**
Time range defined by start and end date/time.

A time period defined by a start and end date and optionally time.
*/
public struct Period: Codable {
    
    /// End time with inclusive boundary, if not ongoing.
    public var end: String?
    
    /// Starting time with inclusive boundary.
    public var start: String?

}
