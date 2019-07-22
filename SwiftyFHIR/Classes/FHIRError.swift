//
//  FHIRError.swift
//  App
//
//  Created by Andrei on 15/07/2019.
//

import Foundation


/// 🔥 error
public enum FHIRError: Error, CustomStringConvertible {
    
    case validation(message: String)
    case noId
    case regex(input: String)
    case date(date: String)
    
    public var description: String {
        switch self {
        case .validation(let message):
            return "🔥 validation error: '\(message)'"
        case .noId:
            return "resource does not have a valid Id"
        case .date(let date):
            return "error when parsing date '\(date)'"
        case .regex(let input):
            return "could not validate regex for '\(input)'"
        }
    }
    
    
}