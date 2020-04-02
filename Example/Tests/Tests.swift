import XCTest
import SwiftyFHIR


enum TestError: Error {
    case resourceNotFound
}






class Tests: XCTestCase {
    
    
    
    
    /// load resource from Bundle
    private func loadResource(_ name: String) throws -> Data {
        let testBundle = Bundle(for: type(of: self))
        guard let ressourceURL = testBundle.url(forResource: name, withExtension: "json") else {
            throw TestError.resourceNotFound
        }
        
        return try Data(contentsOf: ressourceURL)
    }
    
    private func check<T>(_ type: T.Type, name: String) throws
        where T:ResourceType {
        let json = try loadResource(name)
        let resource = try T(json: json)
        try resource.validate()
    }
    
    
    func testCondition() {
        XCTAssertNoThrow(try check(Condition.self, name: "STU3 - Condition - acceptable pain"))
        XCTAssertNoThrow(try check(Condition.self, name: "STU3 - Condition - wound red"))
        XCTAssertNoThrow(try check(Condition.self, name: "STU3 - Condition-example-duplicate-13"))
        XCTAssertNoThrow(try check(Condition.self, name: "STU3 - Condition-example-duplicate-16"))
    }
    
    func testMedia() {
        XCTAssertNoThrow(try check(Media.self, name: "STU3 - Media - wound image"))
        XCTAssertNoThrow(try check(Media.self, name: "STU3 - Media-example-duplicate-2"))
        XCTAssertNoThrow(try check(Media.self, name: "STU3 - media-example-eczema-comprehensive-data"))
        XCTAssertNoThrow(try check(Media.self, name: "STU3 - media-example-eczema-minimum-data"))
    }
    
    func testMedication() {
        XCTAssertNoThrow(try check(Medication.self, name: "STU3 - Medication-example-duplicate-2"))
        XCTAssertNoThrow(try check(Medication.self, name: "STU3 - Medication-example-duplicate-4"))
        XCTAssertNoThrow(try check(Medication.self, name: "STU3 - Medication-example-duplicate-5"))
    }
    
    func testObservation() {
        XCTAssertNoThrow(try check(Observation.self, name: "STU3 - Observation - Body weight"))
        XCTAssertNoThrow(try check(Observation.self, name: "STU3 - Observation - Heart rate"))
        XCTAssertNoThrow(try check(Observation.self, name: "STU3 - Observation - Score list delirium"))
        XCTAssertNoThrow(try check(Observation.self, name: "STU3 - Observation - Vital Sign Systolische bloeddruk"))
        XCTAssertNoThrow(try check(Observation.self, name: "STU3 - Observation - body temperature"))
    }

    func testPatient() {
        XCTAssertNoThrow(try check(Patient.self, name: "STU3 - Patient - example1"))
        XCTAssertNoThrow(try check(Patient.self, name: "STU3 - Patient - example2"))
        XCTAssertNoThrow(try check(Patient.self, name: "STU3 - Patient - example3"))
    }
    
    func testPractitioner() {
        XCTAssertNoThrow(try check(Practitioner.self, name: "STU3 - Practitioner - 1"))
        XCTAssertNoThrow(try check(Practitioner.self, name: "STU3 - Practitioner - 2"))
        XCTAssertNoThrow(try check(Practitioner.self, name: "STU3 - Practitioner - 3"))
    }
    
    func testOrganization() {
        XCTAssertNoThrow(try check(Organization.self, name: "STU3 - Organization - BUMC"))
        XCTAssertNoThrow(try check(Organization.self, name: "STU3 - Organization - AUMC"))
        XCTAssertNoThrow(try check(Organization.self, name: "STU3 - Organization - ENT"))
    }

    
}



// ==============================================================
// MARK: Codable
// ==============================================================
fileprivate extension Encodable {
    func encode(with encoder: JSONEncoder = JSONEncoder()) throws -> Data {
        return try encoder.encode(self)
    }
}

fileprivate extension Decodable {
    static func decode(with decoder: JSONDecoder = JSONDecoder(), from data: Data) throws -> Self {
        return try decoder.decode(Self.self, from: data)
    }

    /// init with JSON
    init(json: Data, decoder: JSONDecoder = JSONDecoder()) throws {
        self = try Self.decode(with: decoder, from: json)
    }
}


