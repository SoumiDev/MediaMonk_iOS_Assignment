//
//  HomeViewControllerTestCase.swift
//  PhotoViewerTests
//
//  Created by Dutta, Soumitra on 23/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import XCTest
@testable import PhotoViewer
class HomeViewControllerTestCase: XCTestCase {
    var homeViewController : HomeViewController! = nil
    override func setUp() {
        let storyboard = UIStoryboard(name: PhotoviewerConstants.mainStoryboardName, bundle: nil)
        homeViewController = storyboard.instantiateViewController(withIdentifier: PhotoviewerConstants.Identifier.homeViewController) as? HomeViewController
        homeViewController.photoTableDataSource.isMock = true
        
    }
    
    override func tearDown() {
        homeViewController = nil
    }
    
    
    
    // MARK:- Test Cases
    
    func testViewDiLoad() {
        //ARRANGE
        setUpViewControllerToRootViewController()
        
        //ACT
        homeViewController.viewDidLoad()
        
        //ASSERT
        XCTAssertEqual(homeViewController.tablePhoto.estimatedRowHeight, CGFloat(PhotoviewerConstants.tablePhotoEstimatedRowHeight))
    }
    
    
    
    // MARK: - Tableview Data Source TestCases
    func testNumberOfSections_ShouldBeCount3() {
        //ARRANGE
        setUpTableViewDataSource()
        setUpViewControllerToRootViewController()
        
        //ACT
        let noOfSection = homeViewController.numberOfSections(in: homeViewController!.tablePhoto)
        
        //ASSERT
        XCTAssertEqual(noOfSection, 3, "Incorrect number of Sections")
    }
    
    func testNumberOfRowsInSection0_ShouldBeCount2() {
        //ARRANGE
        setUpTableViewDataSource()
        setUpViewControllerToRootViewController()
        
        //ACT
        let rowCount = homeViewController.tableView(homeViewController.tablePhoto, numberOfRowsInSection: 0)
        
        //ASSERT
        XCTAssertEqual(rowCount, 2, "Incorrect number of rows")
    }
    
    func testcellForRowForPhotoItemCell() {
        //ARRANGE
        setUpTableViewDataSource()
        setUpViewControllerToRootViewController()
        let indexPath = IndexPath(row: 0, section: 0)
        
        //ACT
        let cell = homeViewController.tableView(homeViewController.tablePhoto, cellForRowAt: indexPath)
        let lblTtile = cell.contentView.viewWithTag(2) as! UILabel
        //ASSERT
        XCTAssertEqual(lblTtile.text , "Test1")
    }
    
    func testHeightForRow_ShouldReturnUITableViewAutomaticDimension() {
        //ARRANGE
        setUpTableViewDataSource()
        setUpViewControllerToRootViewController()
        let indexPath = IndexPath(row: 0, section: 0)
        
        //ACT
        let resultedDimension = homeViewController.tableView(homeViewController.tablePhoto, heightForRowAt: indexPath)
        
        //ASSERT
        XCTAssertEqual(resultedDimension, UITableView.automaticDimension)
    }
    
    func testHeightForHeader_ShouldReturnUITableViewAutomaticDimension() {
        //ARRANGE
        setUpTableViewDataSource()
        setUpViewControllerToRootViewController()
        
        //ACT
        let resultedDimension = homeViewController.tableView(homeViewController.tablePhoto, heightForHeaderInSection: 0)
        
        //ASSERT
        XCTAssertEqual(resultedDimension, UITableView.automaticDimension)
    }
    
    func testviewForHeaderInSection_ShouldRetunAlbumTitle() {
        //ARRANGE
        setUpTableViewDataSource()
        setUpViewControllerToRootViewController()
        
        //ACT
        let headerView = homeViewController.tableView(homeViewController.tablePhoto, viewForHeaderInSection: 0) as! DefaultTableHeaderView
        
        //ASSERT
        XCTAssertEqual(headerView.titleLabel.text,PhotoviewerConstants.photoSectionHeader + "1")
    }
    
    func testPhotoServiceCall_ToCheckSuccessBlock() {
     //ARRANGE
     let mockPhotoServiceHelper = MockPhotoServiceHelper()
     homeViewController.photoTableDataSource.photoServiceHelper = mockPhotoServiceHelper
     mockPhotoServiceHelper.webServiceCallShouldSucceed = true
     homeViewController.photoTableDataSource.isMock = false
     homeViewController.photoTableDataSource.initFetchwithLoading(displayLoading: false)
     homeViewController.photoTableDataSource.setupPhotoDataItem()
     setUpViewControllerToRootViewController()
     
     //ACT
     let noOfSection = homeViewController.numberOfSections(in: homeViewController!.tablePhoto)
     
     //ASSERT
     XCTAssertEqual(noOfSection, 2, "Incorrect number of section")
     }
    
    func testNavigateToPhotoDetailsVC()  {
        //ARRANGE
        let navigationController = UINavigationController(rootViewController: homeViewController)
        UIApplication.shared.keyWindow?.rootViewController = navigationController
        setUpTableViewDataSource()
        
        //ACT
        let indexPath = IndexPath(row: 0, section: 0)
        let item = homeViewController.photoTableDataSource.sectionList[indexPath.section].items[indexPath.row]
        item.execute(with: homeViewController, animated: false)
        
        
        //ASSERT
        XCTAssertTrue(navigationController.visibleViewController is PhotoDetailsViewController)
        
    }
    
    
    // MARK: - Helper Methods
    func setUpViewControllerToRootViewController() {
        UIApplication.shared.keyWindow?.rootViewController = homeViewController
    }
    
    func setUpTableViewDataSource(){
        let photoTestData = PhotoTestData()
        homeViewController.photoTableDataSource.arrPhotoData = photoTestData.getPhotoDataList()
        homeViewController.photoTableDataSource.setupPhotoDataItem()
    }
    
}
