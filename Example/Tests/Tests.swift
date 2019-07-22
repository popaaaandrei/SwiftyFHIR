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
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    func testCondition1() {
        do {
            let conditionJson = try loadResource("STU3 - Condition - acceptable pain")
            let condition = try Condition(json: conditionJson)
            try condition.validate()
        }
        catch {
            XCTFail("\(error)")
        }
        
        XCTAssert(true, "Pass")
    }
    
    
    func testCondition2() {
        do {
            let conditionJson = try loadResource("STU3 - Condition - wound red")
            let condition = try Condition(json: conditionJson)
            try condition.validate()
        }
        catch {
            XCTFail("\(error)")
        }
        
        XCTAssert(true, "Pass")
    }
    
    
    
    func testMedia() {
        do {
            let mediaJson = try loadResource("STU3 - Media - wound image")
            let media = try Media(json: mediaJson)
            try media.validate()
        }
        catch {
            XCTFail("\(error)")
        }
        
        XCTAssert(true, "Pass")
    }
    
    
    func testObservation1() {
        do {
            let observationJson = try loadResource("STU3 - Observation - body temperature")
            let observation = try Observation(json: observationJson)
            try observation.validate()
        }
        catch {
            XCTFail("\(error)")
        }
        
        XCTAssert(true, "Pass")
    }
    
    func testObservation2() {
        do {
            let observationJson = try loadResource("STU3 - Observation - Body weight")
            let observation = try Observation(json: observationJson)
            try observation.validate()
        }
        catch {
            XCTFail("\(error)")
        }
        
        XCTAssert(true, "Pass")
    }
    
    func testObservation3() {
        do {
            let observationJson = try loadResource("STU3 - Observation - Heart rate")
            let observation = try Observation(json: observationJson)
            try observation.validate()
        }
        catch {
            XCTFail("\(error)")
        }
        
        XCTAssert(true, "Pass")
    }
    
    func testObservation4() {
        do {
            let observationJson = try loadResource("STU3 - Observation - Score list delirium")
            let observation = try Observation(json: observationJson)
            try observation.validate()
        }
        catch {
            XCTFail("\(error)")
        }
        
        XCTAssert(true, "Pass")
    }
    
    func testObservation5() {
        do {
            let observationJson = try loadResource("STU3 - Observation - Vital Sign Systolische bloeddruk")
            let observation = try Observation(json: observationJson)
            try observation.validate()
        }
        catch {
            XCTFail("\(error)")
        }
        
        XCTAssert(true, "Pass")
    }
    
}
