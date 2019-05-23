//
//  PhotoviewerConstants.swift
//  PhotoViewer
//
//  Created by Dutta, Soumitra on 22/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import UIKit

struct PhotoviewerConstants {
    
    static let mainStoryboardName = "Main"
    static let launchScreenName = "LaunchScreen"
    static let defaultTableHeaderViewName = "DefaultTableHeaderView"
    
    struct Identifier {
        static let welcomeViewController = "WelcomeVC"
        static let homeViewController = "HomeVC"
        static let defaultTableHeaderView = "DefaultTableHeaderView"
        static let photoItemCell = "PhotoItemCell"
        static let photoDetailsViewController = "PhotoDetailsVC"
    }
    
    struct ImageName {
        static let noImage = "NoImage"
        static let no_Image = "No_Image"
    }
    struct ViewAnimation {
        static let initialWidth: CGFloat = 500
        static let initialHeight: CGFloat = 300
        static let finalWidth: CGFloat = 250
        static let finalHeight: CGFloat = 150
    }
    
    struct PhotoObject {
        static let albumId = "albumId"
        static let photoID = "id"
        static let photoTitle = "title"
        static let photoUrl = "url"
        static let photThumbnailUrl = "thumbnailUrl"
    }
    
    static let photoSectionHeader = "Album"
    static let error = "Error"
    static let projectName = "Photo Viewer"
    static let home = "Home"
    static let pullToRefresh = "Pull to refresh"
    static let networkNotAvailable = "Network not available.Please check your internet connection."
    static let noInternetConnection = "No internet connection available. Pease try again later."
    static let  okAlertTitle = "OK"
    static let arrayDownLoadingQueue = "ArrayDownLoadingQueue"
    static let thumbImageDownload = "ThumbImageDownload"
    static let mainImageDownload = "MainImageDownload"
    static let photoDetails = "Photo Details"
    static let serviceUnavailable = "Service is currently unavailable. Please try agagin later."
    static let tablePhotoEstimatedRowHeight = 80
    static let tablePhotoEstimatedHeaderHeight = 60
    static let welcomScreenTitle = "Photo Viewer \n Experience Amazing Photo App."
    
    struct AccessibiltyIdentifier {
        static let photoTable = "Home-Photoble"
        static let photoTableCell = "Home-PhotoTableCell"
        static let phottableHeader = "Home-PhotoTableHeader"
        static let activityIndicator = "Loading-View"
        static let photoDetailsLblTitle = "PhotoDetail-LblTitle"
        static let photDetailMainImage = "PhotoDetail-MainImage"
    }
    
    struct customColor {
        static let customBlue = UIColor(red: 13/255.0, green: 25/255.0, blue: 51/255.0, alpha: 1.0)
        // TODO: Use Hex String Instead of RGB
        static let themeBlue = UIColor(red: 34/255.0, green: 145/255.0, blue: 231/255.0, alpha: 1.0)
        static let themeGray = UIColor(red: 232/255.0, green: 232/255.0, blue: 232/255.0, alpha: 1.0)
    }
}
