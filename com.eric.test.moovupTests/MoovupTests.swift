import XCTest
@testable import com_eric_test_moovup

final class MoovupTests: XCTestCase {
    // Given
    let jsonResponse = """
{
        "_id": "ae61bba4-4110-45a7-84c5-ab1c08a86a1d",
        "name": {
            "last": "Calhoun",
            "first": "Amparo"
        },
        "email": "sue.patterson@exoteric.press",
        "picture": "https://placebear.com/60/121",
        "location": {
            "latitude": 22.37,
            "longitude": 113.34
        }
}
""".data(using: .utf8)
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPersonIsValid() throws {
        // When
        let person  = try? JSONDecoder().decode(Person.self, from: jsonResponse!)
        
        guard let person = person else {
            XCTFail("Failed to convert JSON string to Person model")
            return
        }
        
        // Then
        XCTAssertEqual(person.id, "ae61bba4-4110-45a7-84c5-ab1c08a86a1d", "Invalid id value")
        XCTAssertEqual(person.name.first, "Amparo", "Invalid firstname value")
        XCTAssertEqual(person.name.last, "Calhoun", "Invalid lastname value")
        XCTAssertEqual(person.email, "sue.patterson@exoteric.press", "Invalid email value")
        XCTAssertEqual(person.picture, "https://placebear.com/60/121", "Invalid picture value")
        XCTAssertEqual(person.location.latitude, 22.37, "Invalid latitude value")
        XCTAssertEqual(person.location.longitude, 113.34, "Invalid longitude value")
    }
    
    func testPersonFullname() throws {
        // When
        let person  = try? JSONDecoder().decode(Person.self, from: jsonResponse!)
        
        guard let person = person else {
            XCTFail("Failed to convert JSON string to Person model")
            return
        }
        
        // Then
        XCTAssertEqual(person.name.fullName(), "Amparo Calhoun", "Invalid fullname value")
    }

    func testPersonLocationIsInvalid() throws {
        // Given missing longitude value
        let jsonResponse = """
{
        "_id": "ae61bba4-4110-45a7-84c5-ab1c08a86a1d",
        "name": {
            "last": "Calhoun",
            "first": "Amparo"
        },
        "email": "sue.patterson@exoteric.press",
        "picture": "https://placebear.com/60/121",
        "location": {
            "latitude": 22.37,
            "longitude": null
        }
}
""".data(using: .utf8)
        
        // When
        let person  = try? JSONDecoder().decode(Person.self, from: jsonResponse!)
        
        guard let person = person else {
            XCTFail("Failed to convert JSON string to Person model")
            return
        }
        
        // Then
        XCTAssertFalse(person.location.isValid(), "Location is unexpected valid")
    }
    
    func testPersonInvalidFormat() throws {
        // Given missing email
        let jsonResponse = """
{
        "_id": "ae61bba4-4110-45a7-84c5-ab1c08a86a1d",
        "name": {
            "last": "Calhoun",
            "first": "Amparo"
        },
        "picture": "https://placebear.com/60/121",
        "location": {
            "latitude": 22.37,
            "longitude": null
        }
}
""".data(using: .utf8)
        
        // When
        let person  = try? JSONDecoder().decode(Person.self, from: jsonResponse!)
        
        // Then
        XCTAssertNil(person, "Person is converted from invalid json")
    }
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
