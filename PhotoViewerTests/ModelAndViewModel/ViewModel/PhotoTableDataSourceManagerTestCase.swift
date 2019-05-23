//
//  PhotoTableDataSourceManagerTestCase.swift
//  PhotoViewerTests
//
//  Created by Dutta, Soumitra on 23/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import XCTest
@testable import PhotoViewer

class PhotoTableDataSourceTestCase: XCTestCase {
    
    var photoTableDataSource: PhotoTableDataSource!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        photoTableDataSource = PhotoTableDataSource()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        photoTableDataSource = nil
    }
    
    func testSetupPhotoDataResponse() {
        
        //ARRANGE
        var photoDataArrayOfDic = [ResponseDic]()
        let photoTestData = PhotoTestData()
        photoDataArrayOfDic = photoTestData.getPhotoDataArrayOfDic()
        
        //ACT
        photoTableDataSource.setUpPhotoList(arrList: photoDataArrayOfDic)
        
        //ASSERT
        XCTAssertEqual(photoTableDataSource.arrPhotoData.count, 3)
        
    }
    
    func testSetupPhotoDataItem() {
        
        //ARRANGE
        var photoDataArrayOfDic = [ResponseDic]()
        let photoTestData = PhotoTestData()
        photoDataArrayOfDic = photoTestData.getPhotoDataArrayOfDic()
        
        //ACT
        
        photoTableDataSource.setUpPhotoList(arrList: photoDataArrayOfDic)
        photoTableDataSource.setupPhotoDataItem()
        
        //ASSERT
        XCTAssertEqual(photoTableDataSource.sectionList.count, 2)
        
    }
    
}
