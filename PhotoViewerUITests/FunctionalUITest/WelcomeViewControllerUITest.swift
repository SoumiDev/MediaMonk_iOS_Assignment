//
//  WelcomeViewControllerUITest.swift
//  PhotoViewerUITests
//
//  Created by Dutta, Soumitra on 23/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import XCTest

class WelcomeViewControllerUITest: PhotoViewerUITests {
    
    var welcomeScreen : WelcomeViewScreen!
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        welcomeScreen = nil
    }
    
    func testMinimumElementLoaded() {
        welcomeScreen = WelcomeViewScreen()
        XCTAssertTrue(welcomeScreen.lblTitle.exists)
    }
    
}
