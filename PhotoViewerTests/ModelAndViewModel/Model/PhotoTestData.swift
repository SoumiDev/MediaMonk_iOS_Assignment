//
//  PhotoTestData.swift
//  PhotoViewerTests
//
//  Created by Dutta, Soumitra on 23/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import Foundation
@testable import PhotoViewer

class PhotoTestData {
    func getPhotoDataList() -> [PhotoData] {
        
        var arrPhotoData = [PhotoData]()
        var photoData1 = PhotoData()
        photoData1.photoAlbumID = 1
        photoData1.photoID = 1001
        photoData1.photoTitle = "Test1"
        photoData1.photoUrl = "Test ImageUrl 1"
        photoData1.photThumbnailUrl = "Test Thumbnail Image Url 1"
        arrPhotoData.append(photoData1)
        
        var photoData2 = PhotoData()
        photoData2.photoAlbumID = 1
        photoData2.photoID = 1002
        photoData2.photoTitle = "Test2"
        photoData2.photoUrl = "Test ImageUrl 2"
        photoData2.photThumbnailUrl = "Test Thumbnail Image Url 2"
        arrPhotoData.append(photoData2)
        
        var photoData3 = PhotoData()
        photoData3.photoAlbumID = 2
        photoData3.photoID = 1003
        photoData3.photoTitle = "Test3"
        photoData3.photoUrl = "Test ImageUrl 3"
        photoData3.photThumbnailUrl = "Test Thumbnail Image Url 3"
        arrPhotoData.append(photoData3)
        
        var photoData4 = PhotoData()
        photoData4.photoAlbumID = 3
        photoData4.photoID = 1004
        photoData4.photoTitle = "Test4"
        photoData4.photoUrl = "Test ImageUrl 4"
        photoData4.photThumbnailUrl = "Test Thumbnail Image Url 4"
        arrPhotoData.append(photoData4)
        
        
        return arrPhotoData
    }
    
    func getPhotoDataArrayOfDic() -> [ResponseDic] {
        var arrOfDicPhotoData = [ResponseDic]()
        var dictionary1 = ResponseDic()
        dictionary1[PhotoviewerConstants.PhotoObject.albumId] = 1
        dictionary1[PhotoviewerConstants.PhotoObject.photoID] = 1001
        dictionary1[PhotoviewerConstants.PhotoObject.photoTitle] = "Test1"
        dictionary1[PhotoviewerConstants.PhotoObject.photoUrl] = "Test ImageUrl 1"
        dictionary1[PhotoviewerConstants.PhotoObject.photThumbnailUrl] = "Test Thumbnail Image Url 1"
        arrOfDicPhotoData.append(dictionary1)
        
        var dictionary2 = ResponseDic()
        dictionary2[PhotoviewerConstants.PhotoObject.albumId] = 1
        dictionary2[PhotoviewerConstants.PhotoObject.photoID] = 1002
        dictionary2[PhotoviewerConstants.PhotoObject.photoTitle] = "Test2"
        dictionary2[PhotoviewerConstants.PhotoObject.photoUrl] = "Test ImageUrl 2"
        dictionary2[PhotoviewerConstants.PhotoObject.photThumbnailUrl] = "Test Thumbnail Image Url 2"
        arrOfDicPhotoData.append(dictionary2)
        
        var dictionary3 = ResponseDic()
        dictionary3[PhotoviewerConstants.PhotoObject.albumId] = 2
        dictionary3[PhotoviewerConstants.PhotoObject.photoID] = 1003
        dictionary3[PhotoviewerConstants.PhotoObject.photoTitle] = "Test3"
        dictionary3[PhotoviewerConstants.PhotoObject.photoUrl] = "Test ImageUrl 3"
        dictionary3[PhotoviewerConstants.PhotoObject.photThumbnailUrl] = "Test Thumbnail Image Url 3"
        arrOfDicPhotoData.append(dictionary3)
        
        return arrOfDicPhotoData
        
    }
}


