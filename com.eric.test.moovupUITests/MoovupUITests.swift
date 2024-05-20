import XCTest

final class MoovupUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLanding() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let listViewButton = app.buttons["List View"]
        let mapViewButton = app.buttons["Map View"]
        
        XCTAssertTrue(listViewButton.exists, "List View button not found")
        XCTAssertTrue(mapViewButton.exists, "Map View button not found")
        
        // Navigate to map view
        mapViewButton.tap()
        let map = app.maps.firstMatch
        XCTAssertTrue(map.exists, "Map not exist")
        
        // Navigate to list view
        listViewButton.tap()
        let mapShouldNotExist = app.maps.firstMatch
        XCTAssertFalse(mapShouldNotExist.exists, "Map unexpected exist")
    }
    
    func testNavigateToDetail() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // When wait for data loaded
        guard app.collectionViews.element.waitForExistence(timeout: 10) else {
            XCTFail()
            return
        }
        
        let firstItem = app.collectionViews.cells.firstMatch
        firstItem.tap()
        
        let map = app.maps.firstMatch
        XCTAssertTrue(map.exists, "Map not exist")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
