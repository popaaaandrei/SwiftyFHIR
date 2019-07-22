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
            let _ = try Condition(json: conditionJson)
        }
        catch {
            XCTFail("\(error)")
        }
        
        XCTAssert(true, "Pass")
    }
    
    
    func testCondition2() {
        do {
            let conditionJson = try loadResource("STU3 - Condition - wound red")
            let _ = try Condition(json: conditionJson)
        }
        catch {
            XCTFail("\(error)")
        }
        
        XCTAssert(true, "Pass")
    }
    
    
    
    func testMedia() {
        do {
            let mediaJson = try loadResource("STU3 - Media - wound image")
            let _ = try Media(json: mediaJson)
        }
        catch {
            XCTFail("\(error)")
        }
        
        XCTAssert(true, "Pass")
    }
    
    
    func testObservation() {
        do {
            let observationJson = try loadResource("STU3 - Observation - body temperature")
            let _ = try Media(json: observationJson)
        }
        catch {
            XCTFail("\(error)")
        }
        
        XCTAssert(true, "Pass")
    }
    
}
