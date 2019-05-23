//
//  PhotoDetailsViewController.swift
//  PhotoViewer
//
//  Created by Dutta, Soumitra on 22/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
    
    @IBOutlet weak var mainImage: UIImageView!
    var urlString = ""
    var headerTtitle = ""
    @IBOutlet weak var lblTtile: MarqueeLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set UI
        setUpUI()
    }
    
    // MARK: - UI SetUP
    func setUpUI() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = PhotoviewerConstants.customColor.themeBlue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: PhotoviewerConstants.customColor.themeBlue]
        title = PhotoviewerConstants.photoDetails
        lblTtile.accessibilityIdentifier = PhotoviewerConstants.AccessibiltyIdentifier.photoDetailsLblTitle
        mainImage.accessibilityIdentifier = PhotoviewerConstants.AccessibiltyIdentifier.photDetailMainImage

        lblTtile.innerText = headerTtitle
        lblTtile.innerSize = 20
        lblTtile.innerColor = PhotoviewerConstants.customColor.themeBlue
        mainImage.layer.masksToBounds = true
        mainImage.layer.borderWidth = 2
        mainImage.layer.borderColor = PhotoviewerConstants.customColor.themeBlue.cgColor
        downloadMainImage()
    }
    
    
    // MARK: - Image Download
    func downloadMainImage() {
        PhotoDownloadManager.shared.setUpMainImage(imageView: mainImage, urlString: urlString)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        PhotoDownloadManager.shared.clearCache()
    }
    
    
}
