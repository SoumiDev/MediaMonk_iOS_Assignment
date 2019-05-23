//
//  HomeViewControllerUITest.swift
//  PhotoViewerUITests
//
//  Created by Dutta, Soumitra on 23/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import XCTest

class HomeViewControllerUITest: PhotoViewerUITests {
    
    var homeVC : HomeScreen!
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMinimumElementLoaded() {
        homeVC = HomeScreen()
        waitForNavigation(element: homeVC.photoTable, timeout: 100.0)
        XCTAssertTrue(homeVC.photoTable.exists)
    }
    
    
}
