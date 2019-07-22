//
//  JSON.swift
//  GoClinic
//
//  Created by Andrei on 08/03/19.
//  Copyright © 2019 GoClinic B.V. All rights reserved.
//


import Foundation



public let __RFC3339DateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    // coordinated universal time (UTC)
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    return dateFormatter
}()


/// objc.io
/// https://www.objc.io/blog/2018/12/04/unexpected-results-from-a-date-formatter/
public let __ISO8601DateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    // coordinated universal time (UTC)
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    return dateFormatter
}()


public let __JSONEncoder: JSONEncoder = {
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .formatted(__ISO8601DateFormatter)
    return encoder
}()

public let __JSONDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(__ISO8601DateFormatter)
    return decoder
}()



// ==============================================================
// MARK: Codable
// ==============================================================
public extension Encodable {
    func encode(with encoder: JSONEncoder = __JSONEncoder) throws -> Data {
        return try encoder.encode(self)
    }
}

public extension Decodable {
    static func decode(with decoder: JSONDecoder = __JSONDecoder, from data: Data) throws -> Self {
        return try decoder.decode(Self.self, from: data)
    }
    
    /// init with JSON
    init(json: Data, decoder: JSONDecoder = __JSONDecoder) throws {
        self = try Self.decode(with: decoder, from: json)
    }
}


// ==============================================================
// MARK: Array
// ==============================================================
public extension Array where Element : Codable {
    
    func encode(with encoder: JSONEncoder = __JSONEncoder) throws -> Data {
        return try encoder.encode(self)
    }
    
    static func decode(with decoder: JSONDecoder = __JSONDecoder, from data: Data) throws -> [Element] {
        return try decoder.decode([Element].self, from: data)
    }
    
    /// init with JSON
    init(json: Data, decoder: JSONDecoder = __JSONDecoder) throws {
        self = try [Element].decode(with: decoder, from: json)
    }
    
}


// =====================================================================
// MARK: Dictionary
// =====================================================================

public extension Dictionary where Key == String, Value : Codable {
    
    /// init with JSON
    init(json: Data) throws {
        let decoder = JSONDecoder()
        self = try decoder.decode([String: Value].self, from: json)
    }
    
    /// convert to JSON
    func encode(with encoder: JSONEncoder = __JSONEncoder) throws -> Data {
        return try encoder.encode(self)
    }
    
}




