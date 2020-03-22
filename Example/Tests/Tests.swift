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
    
    
    private func observationCheck(_ name: String) throws {
        let observationJson = try loadResource(name)
        let observation = try Observation(json: observationJson)
        try observation.validate()
    }
    
    private func conditionCheck(_ name: String) throws {
        let conditionJson = try loadResource(name)
        let condition = try Condition(json: conditionJson)
        try condition.validate()
    }
    
    private func mediaCheck(_ name: String) throws {
        let mediaJson = try loadResource(name)
        let media = try Media(json: mediaJson)
        try media.validate()
    }
    
    private func medicationCheck(_ name: String) throws {
        let medicationJson = try loadResource(name)
        let medication = try Medication(json: medicationJson)
        try medication.validate()
    }
    
    
    private func patientCheck(_ name: String) throws {
        let patientJson = try loadResource(name)
        let patient = try Patient(json: patientJson)
        try patient.validate()
    }
    
    
    func testCondition() {
        XCTAssertNoThrow(try conditionCheck("STU3 - Condition - acceptable pain"))
        XCTAssertNoThrow(try conditionCheck("STU3 - Condition - wound red"))
        XCTAssertNoThrow(try conditionCheck("STU3 - Condition-example-duplicate-13"))
        XCTAssertNoThrow(try conditionCheck("STU3 - Condition-example-duplicate-16"))
    }
    
    
    
    func testMedia() {
        XCTAssertNoThrow(try mediaCheck("STU3 - Media - wound image"))
        XCTAssertNoThrow(try mediaCheck("STU3 - Media-example-duplicate-2"))
        XCTAssertNoThrow(try mediaCheck("STU3 - media-example-eczema-comprehensive-data"))
        XCTAssertNoThrow(try mediaCheck("STU3 - media-example-eczema-minimum-data"))
    }
    
    func testMedication() {
        XCTAssertNoThrow(try medicationCheck("STU3 - Medication-example-duplicate-2"))
        XCTAssertNoThrow(try medicationCheck("STU3 - Medication-example-duplicate-4"))
        XCTAssertNoThrow(try medicationCheck("STU3 - Medication-example-duplicate-5"))
    }
    
    
    func testObservation() {
        XCTAssertNoThrow(try observationCheck("STU3 - Observation - Body weight"))
        XCTAssertNoThrow(try observationCheck("STU3 - Observation - Heart rate"))
        XCTAssertNoThrow(try observationCheck("STU3 - Observation - Score list delirium"))
        XCTAssertNoThrow(try observationCheck("STU3 - Observation - Vital Sign Systolische bloeddruk"))
        XCTAssertNoThrow(try observationCheck("STU3 - Observation - body temperature"))
    }
    

    func testPatient() {
        XCTAssertNoThrow(try patientCheck("STU3 - Patient - example1"))
        XCTAssertNoThrow(try patientCheck("STU3 - Patient - example2"))
        XCTAssertNoThrow(try patientCheck("STU3 - Patient - example3"))
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


