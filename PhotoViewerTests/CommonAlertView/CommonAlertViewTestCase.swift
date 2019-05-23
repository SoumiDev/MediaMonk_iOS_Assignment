//
//  CommonAlertViewTestCase.swift
//  PhotoViewerTests
//
//  Created by Dutta, Soumitra on 23/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import XCTest
@testable import PhotoViewer

class CommonAlertViewTestCase: XCTestCase {
    
    var vc: WelcomeViewController!
    override func setUp() {
        let storyboard = UIStoryboard(name: PhotoviewerConstants.mainStoryboardName, bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: PhotoviewerConstants.Identifier.welcomeViewController) as? WelcomeViewController
    }
    
    override func tearDown() {
        vc = nil
    }
    
    // MARK : - Test Cases
    func testAlert() {
        
        //ARRANGE
        setUpViewControllerToRootViewController()
        
        //ACT
        CommonAlertView.showCommonAlert(viewController: vc, title: PhotoviewerConstants.projectName, message: PhotoviewerConstants.networkNotAvailable, OkButtonTitle: PhotoviewerConstants.okAlertTitle)
        
        // ASSERT
        XCTAssertTrue(vc.presentedViewController is UIAlertController)
        XCTAssertEqual(vc.presentedViewController?.title, PhotoviewerConstants.projectName)
    }
    
    // MARK: - Helper Methods
    func setUpViewControllerToRootViewController() {
        UIApplication.shared.keyWindow?.rootViewController = vc
    }
    
}
