//
//  PhotoCellItem.swift
//  PhotoViewer
//
//  Created by Dutta, Soumitra on 22/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import UIKit

class PhotoCellItem : TableSectionItem {
    @available(*, unavailable)
    override init() {
        fatalError("Error")
    }
    
    // MARK: - Initialization
    init(photoTitle: String, photoThumbnailUrl: String?, mainImageUrl: String?) {
        super.init()
        self.title = photoTitle
        self.thumbnailImageUrl = photoThumbnailUrl
        self.mainImageUrl = mainImageUrl
        self.cellIdentifier = PhotoviewerConstants.Identifier.photoItemCell
    }
    // MARK: - Confgure Item
    override func configure(cell: UITableViewCell, tableView: UITableView, indexPath : NSIndexPath) {
        
        cell.accessibilityIdentifier = PhotoviewerConstants.AccessibiltyIdentifier.photoTableCell
        let lblTitle = cell.contentView.viewWithTag(2) as! UILabel
        lblTitle.text = title
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: PhotoviewerConstants.ImageName.noImage)
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = PhotoviewerConstants.customColor.themeBlue.cgColor
        PhotoDownloadManager.shared.setUpThumbnailImage(imageView: imageView, tableView: tableView,  indexPath: indexPath, urlString: thumbnailImageUrl!)
        
    }
    
    // MARK : - Execute Item
    override func execute(with viewController: UIViewController, animated : Bool) {
        let storyboard = UIStoryboard(name: PhotoviewerConstants.mainStoryboardName, bundle: nil)
        let photoDetailsViewController = storyboard.instantiateViewController(withIdentifier: PhotoviewerConstants.Identifier.photoDetailsViewController) as! PhotoDetailsViewController
        photoDetailsViewController.urlString = mainImageUrl!
        photoDetailsViewController.headerTtitle = title!
        viewController.navigationController?.pushViewController(photoDetailsViewController, animated: animated)
        return
    }
    
    
}
