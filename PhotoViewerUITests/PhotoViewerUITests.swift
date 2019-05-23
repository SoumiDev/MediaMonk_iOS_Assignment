//
//  PhotoViewerUITests.swift
//  PhotoViewerUITests
//
//  Created by Dutta, Soumitra on 23/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import XCTest

class PhotoViewerUITests: XCTestCase {
    
    var app :  XCUIApplication!
    //let appLaunch = AppLaunch()
    override func setUp() {
        continueAfterFailure = false
        //self.app.launch()
        app = XCUIApplication()
        app.launch()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        // app = nil
    }
    
    func waitForLoadingViewActivityIndicatorToBeDismiss() {
        if app.activityIndicators["Loading-View"].exists{
            self.waitForActivityIndicatorToFinishSpinning(self.app.activityIndicators["Loading-View"], timeout: 100.0)
        }
    }
    
    func testWelecomePage() {
        XCTAssertTrue(app.staticTexts["Photo Viewer \n Experience Amazing Photo App."].exists)
    }
    
    
}
