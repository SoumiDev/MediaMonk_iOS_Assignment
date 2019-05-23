//
//  PhotoDetailsViewControllerTestCase.swift
//  PhotoViewerTests
//
//  Created by Dutta, Soumitra on 23/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import XCTest
@testable import PhotoViewer
class PhotoDetailsViewControllerTestCase: XCTestCase {
    
    var photoDetailsVC : PhotoDetailsViewController! = nil
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: PhotoviewerConstants.mainStoryboardName, bundle: nil)
        photoDetailsVC = storyboard.instantiateViewController(withIdentifier: PhotoviewerConstants.Identifier.photoDetailsViewController) as? PhotoDetailsViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        photoDetailsVC = nil
    }
    
    // MARK:- Test Cases
    
    func testViewDiLoad() {
        //ARRANGE
        setUpViewControllerToRootViewController()
        //ACT
        photoDetailsVC.viewDidLoad()
        
        //ASSERT
        XCTAssertEqual(photoDetailsVC.title, PhotoviewerConstants.photoDetails)
    }
    
    // MARK: - Helper Methods
    func setUpViewControllerToRootViewController() {
        UIApplication.shared.keyWindow?.rootViewController = photoDetailsVC
    }
    
}
