//
//  Utils.swift
//
//  Created by Andrei on 14/07/2019.
//  Copyright © 2019 Go Clinic. All rights reserved.
//


import Foundation


// ===========================================================================
// MARK: Bytes
// ===========================================================================

/// Bytes
extension Array where Element == UInt8 {
    
    func asData() -> Data {
        return Data(self)
    }
    
    /// Bytes -> Data -> Base64 String
    func asStringBase64() -> String {
        return Data(self).base64EncodedString()
    }
    
    /// Bytes -> Data -> UTF8 String
    func asStringUTF8() -> String? {
        return String(data: Data(self), encoding: .utf8)
    }
    
}

// ===========================================================================
// MARK: String
// ===========================================================================

extension String {
    

    func asDataBase64() -> Data? {
        guard let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            print("String conversion to Data error")
            return nil
        }
        return data
    }
    
    /// String -> Data -> [UInt8]
    func asBytesBase64() -> [UInt8]? {
        guard let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            print("String conversion to Data error")
            return nil
        }
        
        return Array(data)
    }
    
    /// String -> Data -> [UInt8]
    func asBytesUTF8() -> [UInt8]? {
        
        guard let data = self.data(using: .utf8) else {
            print("String conversion to Data error")
            return nil
        }
        
        return Array(data)
    }
    
    /// String -> Data
    func asDataUTF8() -> Data? {
        
        guard let data = self.data(using: .utf8) else {
            print("String conversion to Data error")
            return nil
        }
        
        return data
    }
    
    
    /// check if it is a valid URL
    func isURL() -> Bool {
    
        let regex = "^(?:(?:https?|ftp):\\/\\/)(?:\\S+(?::\\S*)?@)?(?:(?!(?:10|127)(?:\\.\\d{1,3}){3})(?!(?:169\\.254|192\\.168)(?:\\.\\d{1,3}){2})(?!172\\.(?:1[6-9]|2\\d|3[0-1])(?:\\.\\d{1,3}){2})(?:[1-9]\\d?|1\\d\\d|2[01]\\d|22[0-3])(?:\\.(?:1?\\d{1,2}|2[0-4]\\d|25[0-5])){2}(?:\\.(?:[1-9]\\d?|1\\d\\d|2[0-4]\\d|25[0-4]))|(?:(?:[a-z\\u00a1-\\uffff0-9]-*)*[a-z\\u00a1-\\uffff0-9]+)(?:\\.(?:[a-z\\u00a1-\\uffff0-9]-*)*[a-z\\u00a1-\\uffff0-9]+)*(?:\\.(?:[a-z\\u00a1-\\uffff]{2,}))\\.?)(?::\\d{2,5})?(?:[/?#]\\S*)?$"
        
        guard range(of: regex, options: .regularExpression) != nil else {
            return false
        }
        return true
    }
    
    /// check if it is a valid IPv4 address
    func isIPv4() -> Bool {
        
        let regex = "\\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\b"
        
        guard range(of: regex, options: .regularExpression) != nil else {
            return false
        }
        return true
    }
    
    /// check if it is a valid email address
    func isEmail() -> Bool {
        
        let patternNormal = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        
        let regex = try? NSRegularExpression(pattern: patternNormal, options: .caseInsensitive)
        
        return regex?.firstMatch(in: self, options: [], range: NSMakeRange(0, self.count)) != nil
    }

    
}


// ===========================================================================
// MARK: Data
// ===========================================================================

extension Data {
    
    /// Data -> [UInt8]
    func asBytes() -> [UInt8] {
        return Array(self)
    }
    
    /// Data -> String base64
    func asStringBase64() -> String {
        return self.base64EncodedString()
    }
    
    /// Data -> String UTF8
    func asStringUTF8() -> String? {
        return String(data: self, encoding: .utf8)
    }
    
}




