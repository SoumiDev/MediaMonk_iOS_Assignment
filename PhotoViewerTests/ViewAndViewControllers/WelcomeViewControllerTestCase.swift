//
//  WelcomeViewControllerTestCase.swift
//  PhotoViewerTests
//
//  Created by Dutta, Soumitra on 23/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import XCTest
@testable import PhotoViewer
class WelcomeViewControllerTestCase: XCTestCase {
    var welcomeVC : WelcomeViewController! = nil
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: PhotoviewerConstants.mainStoryboardName, bundle: nil)
        welcomeVC = storyboard.instantiateViewController(withIdentifier: PhotoviewerConstants.Identifier.welcomeViewController) as? WelcomeViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        welcomeVC = nil
    }
    
    // MARK:- Test Cases
    
    func testViewDiLoad() {
        
        //ARRANGE
        setUpViewControllerToRootViewController()
        
        //ACT
        welcomeVC.viewDidLoad()
        
        //ASSERT
        XCTAssertEqual(welcomeVC.lblTitle.text, PhotoviewerConstants.welcomScreenTitle)
    }
    
    func testAnimation() {
        
        //ARRANGE
        setUpViewControllerToRootViewController()
        
        //ACT
        welcomeVC.setUpUIAnimation()
        
        //ASSERT
        XCTAssertEqual(welcomeVC.lblTitle.center, welcomeVC.view.center)
    }
    
    func testNavigateToHomeVC()  {
        //ARRANGE
        let navigationController = UINavigationController(rootViewController: welcomeVC)
        UIApplication.shared.keyWindow?.rootViewController = navigationController
        
        //ACT
        welcomeVC.pushToHomeView()
        
        //ASSERT
        XCTAssertTrue(navigationController.visibleViewController is HomeViewController)
    }
    
    // MARK: - Helper Methods
    func setUpViewControllerToRootViewController() {
        UIApplication.shared.keyWindow?.rootViewController = welcomeVC
    }
    
}
