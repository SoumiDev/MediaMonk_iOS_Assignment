//
//  PhotoHeaderItem.swift
//  PhotoViewer
//
//  Created by Dutta, Soumitra on 22/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import UIKit
class PhotoHeaderItem : TableHeaderItem {
    
    @available(*, unavailable)
    override init() {
        fatalError("Error")
    }
    
    init(title: String) {
        super.init()
        self.title = title
        self.reuseIdentifier = PhotoviewerConstants.Identifier.defaultTableHeaderView
    }
    
    // MARK: - Configure Header Item
    override func configure(headerView: UITableViewHeaderFooterView) {
        let view = headerView as! DefaultTableHeaderView
        view.accessibilityIdentifier = PhotoviewerConstants.AccessibiltyIdentifier.phottableHeader
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        view.contentView.backgroundColor = PhotoviewerConstants.customColor.themeBlue
        view.titleLabel?.textColor = PhotoviewerConstants.customColor.themeBlue
        view.titleLabel?.text = title
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = PhotoviewerConstants.customColor.themeBlue.cgColor
        
    }
}
