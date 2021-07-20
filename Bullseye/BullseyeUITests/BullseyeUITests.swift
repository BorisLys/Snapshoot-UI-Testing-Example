//
//  BullseyeUITests.swift
//  BullseyeUITests
//
//  Created by b.lysikov on 20.07.2021.
//

import FBSnapshotTestCase

class BullseyeUITests: FBSnapshotTestCase {
    
    let app = XCUIApplication()
    
    func verifyView(identifier: String, perPixelTolerance: CGFloat = 0.00, overallTolerance: CGFloat = 0.05) {
        
        guard let screenshotWithoutStatusBar = app.screenshot().image.removingStatusBar else {
            return XCTFail("An error occurred while cropping the screenshot", file: #file, line: #line)
        }
        
        FBSnapshotVerifyView(
            UIImageView(image: screenshotWithoutStatusBar),
            identifier: identifier,
            perPixelTolerance: perPixelTolerance,
            overallTolerance: overallTolerance
        )
    }
    
    func verifyElement(element: XCUIElement,identifier: String) {
        
        FBSnapshotVerifyView(UIImageView(image: element.screenshot().image), identifier: identifier)
    }

    override func setUp() {
        super.setUp()
        
        app.launch()
    
        recordMode = false
        
        fileNameOptions = [
            .OS,
            .device,
            .screenScale,
            .screenSize
        ]
        
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testCheckLeaderBoardScreen() {
        app.buttons["LeaderboardButton"].waitForExistence(timeout: 5)
        app.buttons["LeaderboardButton"].tap()
        Thread.sleep(forTimeInterval: 2)
        verifyView(identifier: "imageLeaderboardScreen")
    }
    
    func testCheckLeaderboardButton() {
        app.buttons["LeaderboardButton"].waitForExistence(timeout: 5)
        verifyElement(element: app.buttons["LeaderboardButton"].firstMatch, identifier: "imageLeaderboardButton")
    }

}
