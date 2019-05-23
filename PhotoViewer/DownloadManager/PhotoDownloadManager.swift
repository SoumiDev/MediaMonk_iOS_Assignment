//
//  PhotoDownloadManager.swift
//  PhotoViewer
//
//  Created by Dutta, Soumitra on 22/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import UIKit
class PhotoDownloadManager {
    
    static let shared = PhotoDownloadManager()
    var task: URLSessionDownloadTask!
    var session: URLSession!
    lazy var cache:NSCache<AnyObject, AnyObject>! = NSCache()
    var arrDownloading = [String]()
    let serialQueue = DispatchQueue(label: PhotoviewerConstants.arrayDownLoadingQueue)
    
    
    // MARK:- SetUp Thumbnail Image
    
    func setUpThumbnailImage(imageView: UIImageView,tableView: UITableView, indexPath : NSIndexPath, urlString : String){
        let keyIndex = urlString
        if (self.cache.object(forKey: keyIndex as AnyObject) != nil){
            //Cached image used, no need to download it.
            imageView.image = cache.object(forKey: keyIndex as AnyObject) as? UIImage
        }
        else if arrDownloading.contains(keyIndex) {
            //Current Image is downloading. Wait to get image downloaded.
            return
        }
        else if NetworkMonitoringManager.shared.isConnectionAvailable {
            // Download Image
            initiateThumbNailImageDownloading(tableView: tableView, indexPath: indexPath, urlString: urlString)
        }
    }
    
    
    
    // MARK:- Thumbnail Image Download
    
    func initiateThumbNailImageDownloading(tableView: UITableView, indexPath : NSIndexPath, urlString : String) {
        let keyIndex = urlString
        let dispatchQueue = DispatchQueue(label: PhotoviewerConstants.thumbImageDownload + keyIndex)
        //Perform task in a background thread
        dispatchQueue.async { [weak self] in
            if let url = URL(string: urlString) {
                // Track Key reference of image downloading
                self?.updateDownLoadingContains(shouldAdd: true, keyIndex: keyIndex)
                //Create URL Request
                let request: URLRequest = URLRequest(url: url)
                // Create Session Configuration
                let sessionConfig = URLSessionConfiguration.default
                // SetUp Session Configuration
                sessionConfig.timeoutIntervalForRequest = Websettings.shared.requestTimeOut
                sessionConfig.timeoutIntervalForResource = Websettings.shared.requestTimeOut
                // Create Session
                let session = URLSession(configuration: sessionConfig)
                //Create Task
                let task = session.dataTask(with: request, completionHandler: {data, response, error -> Void in
                    // Task Completed
                    let error = error
                    let data = data
                    if error == nil {
                        // Download Completed. Remove key reference from Array
                        self?.updateDownLoadingContains(shouldAdd: false, keyIndex: keyIndex)
                        // Convert the downloaded data in to a UIImage object
                        if let image = UIImage(data: data!) {
                            // Store the image into cache
                            self!.cache.setObject(image, forKey: keyIndex as AnyObject)
                            // Update the cell content
                            DispatchQueue.main.async{
                                    if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
                                        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
                                        // Update UIImage
                                        imageView.image = image
                                    }
                            }
                        }
                    }
                    else {
                        // Download Failed. Remove key reference from Array to redownload image.
                        self?.updateDownLoadingContains(shouldAdd: false, keyIndex: keyIndex)
                        
                    }
                })
                // Execute Task
                task.resume()
            }
            
        }
        
    }
    
    // MARK:- SetUp Main Image
    
    func setUpMainImage(imageView: UIImageView, urlString : String){
        let keyIndex = urlString
        if (self.cache.object(forKey: keyIndex as AnyObject) != nil){
            //Cached image used, no need to download it
            imageView.image = cache.object(forKey: keyIndex as AnyObject) as? UIImage
        }
        else if arrDownloading.contains(keyIndex) {
            //Current Image is downloading. Wait to get image downloaded.
            return
        }
        else if NetworkMonitoringManager.shared.isConnectionAvailable {
            // Download Image
            initiateMainImageDownloading(imageView: imageView, urlString: urlString)
        }
    }
    
    
    // MARK:- Main Image Download
    func initiateMainImageDownloading(imageView: UIImageView?,urlString : String) {
        let keyIndex = urlString
        let dispatchQueue = DispatchQueue(label: PhotoviewerConstants.mainImageDownload + keyIndex)
        //Perform task in a background thread
        dispatchQueue.async { [weak self] in
            // Track Key reference of image downloading
            self?.updateDownLoadingContains(shouldAdd: true, keyIndex: keyIndex)
            if let url = URL(string: urlString) {
                //Create URL Request
                let request: URLRequest = URLRequest(url: url)
                //Create Session Configuration
                let sessionConfig = URLSessionConfiguration.default
                sessionConfig.timeoutIntervalForRequest = Websettings.shared.requestTimeOut
                sessionConfig.timeoutIntervalForResource = Websettings.shared.requestTimeOut
                // Create Session
                let session = URLSession(configuration: sessionConfig)
                let task = session.dataTask(with: request, completionHandler: {data, response, error -> Void in
                    // Task Complted
                    let error = error
                    let data = data
                    if error == nil {
                        // Download Completed. Remove key reference from Array
                        self?.updateDownLoadingContains(shouldAdd: false, keyIndex: keyIndex)
                        // Convert the downloaded data in to a UIImage object
                        if let image = UIImage(data: data!) {
                            // Store the image into cache
                            self!.cache.setObject(image, forKey: keyIndex as AnyObject)
                            // Update UIImage
                            DispatchQueue.main.async(execute: { () -> Void in
                                if let imageVw = imageView {
                                    imageVw.image = image
                                }
                            })
                            
                        }
                    }
                    else {
                        // Download Failed. Remove key reference from Array to redownload image.
                        self?.updateDownLoadingContains(shouldAdd: false, keyIndex: keyIndex)
                    }
                    
                })
                // Execute Task
                task.resume()
            }
            
        }
        
    }
    
}



extension PhotoDownloadManager {
    
    // MARK:- Add/Remove Array Downloading contains
    func updateDownLoadingContains(shouldAdd: Bool, keyIndex : String){
        serialQueue.sync {
            if shouldAdd {
                arrDownloading.append(keyIndex)
            }
            else {
                if let index = arrDownloading.index(of: keyIndex) {
                    arrDownloading.remove(at: index)
                }
            }
            
        }
    }
    // MARK:- Dispose Cache
    func clearCache() {
        URLCache.shared.removeAllCachedResponses()
        cache.removeAllObjects()
    }
}


