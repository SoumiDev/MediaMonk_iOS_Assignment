//
//  PhotoDetailsViewControllerUITest.swift
//  PhotoViewerUITests
//
//  Created by Dutta, Soumitra on 23/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import XCTest

class PhotoDetailsViewControllerUITest: PhotoViewerUITests {
    
    var homeScreen : HomeScreen!
    var photoDeailsScreen : PhotoDetailsScreen!
    override func setUp() {
        super.setUp()
        homeScreen = HomeScreen()
        photoDeailsScreen = PhotoDetailsScreen()
        
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMinmumElementLoaded() {
        waitForNavigation(element: homeScreen.photoTable, timeout: 100.0)
        waitForLoadingViewActivityIndicatorToBeDismiss()
        navigateToPhotoDetails()
        wait(element: photoDeailsScreen.lblTitle, timeout: 20.0)
        XCTAssertTrue(app.navigationBars[PhotoviewerConstants.photoDetails].exists)
    }
    
    func navigateToPhotoDetails() {
        app.tables.cells.element(boundBy: 0).tap()
    }
    
}
