//
//  PhotoTableDataSourceManager.swift
//  PhotoViewer
//
//  Created by Dutta, Soumitra on 22/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import Foundation

protocol PhotoTableDataSourceProtocl {
    var sectionList: [TableSection] { get }
    var arrPhotoData : [PhotoData] {get set}
}



class PhotoTableDataSource: PhotoTableDataSourceProtocl {
    var photoServiceHelper : PhotoServiceHelperProtocol
    var arrPhotoData = [PhotoData]()
    lazy var alertMessage : String = ""
    private var photos = [PhotoData]()
    var isMock = false
    var showAlert : (() -> ())?
    var showHideLoading : (() -> ())?
    var reloadPhotoListTable : (() -> ())?
    
    var sectionList = [TableSection]() {
        didSet {
            reloadPhotoListTable?()
        }
    }
    
    init(photoServiceHelper : PhotoServiceHelperProtocol = PhotoServiceHelper()) {
        self.photoServiceHelper = photoServiceHelper
    }
    
    var isLoading : Bool = false {
        didSet{
            showHideLoading?()
        }
    }
    
    func initFetchwithLoading(displayLoading: Bool) {
        //Is Network Available
        if NetworkMonitoringManager.shared.isConnectionAvailable{
            if isMock {
                return
            }
            if displayLoading {
                isLoading = true
            }
            photoServiceHelper.photoServiceRequest(
                successBlock: {
                    [weak self] response in
                    print("Success")
                    self?.isLoading = false
                    self?.setUpPhotoList(arrList: response)
                },
                failureBlock: {
                    [weak self] response in
                    print("Failed")
                    self?.isLoading = false
                    //self?.setUpPhotoList(arrList: [response])
                    self?.alertMessage = PhotoviewerConstants.error
                    self?.showAlert?()
                }
            )
        }
        else{
            alertMessage = PhotoviewerConstants.networkNotAvailable
            showAlert?()
        }
    }
    
    // MARK: - Setup Data From Response
    func setUpPhotoList(arrList: [ResponseDic]){
        if arrList.count > 0 {
            var objectPhoto = arrList[0]
            if let error = objectPhoto["Error"] as? String {
                print(error)
            }
            else {
                photos.removeAll()
                for i in 0..<arrList.count {
                    objectPhoto = arrList[i]
                    var photo = PhotoData()
                    photo.photoAlbumID = objectPhoto["albumId"] as? Int
                    photo.photoID = objectPhoto["id"] as? Int
                    photo.photoTitle = objectPhoto["title"] as? String
                    photo.photoUrl = objectPhoto["url"] as? String
                    photo.photThumbnailUrl = objectPhoto["thumbnailUrl"] as? String
                    arrPhotoData.append(photo)
                }
            }
            
        }
        
        setupPhotoDataItem()
        
        
        
    }
    
    // MARK: - Setup View Model
    func setupPhotoDataItem() {
        var vms = [TableSection]()
        let dicGrouping = Dictionary(grouping: arrPhotoData, by: { $0.photoAlbumID })
        let dic = dicGrouping.sorted{ $0.key! < $1.key! }
        for (key, arr) in dic {
            let tableSection = TableSection()
            let tempKey: String? = String(describing: key!)
            
            guard let unwrappedKey =  tempKey  else {
                return
            }
            
            tableSection.headerItem = PhotoHeaderItem(title: PhotoviewerConstants.photoSectionHeader + "\(unwrappedKey)")
            tableSection.headerItem?.reuseIdentifier = PhotoviewerConstants.Identifier.defaultTableHeaderView
            for obj in arr {
                let tableSectionItem = PhotoCellItem(photoTitle: obj.photoTitle ?? "", photoThumbnailUrl: obj.photThumbnailUrl, mainImageUrl : obj.photoUrl)
                tableSection.items.append(tableSectionItem)
            }
            
            vms.append(tableSection)
        }
        
        sectionList = vms
    }
    
    
}





