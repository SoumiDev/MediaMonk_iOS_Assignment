//
//  TableHeaderItem.swift
//  PhotoViewer
//
//  Created by Dutta, Soumitra on 22/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import UIKit
class TableHeaderItem {
    var reuseIdentifier = ""
    
    var title: String?
    var backgroundColor: UIColor = UIColor.white
    
    internal func configure(headerView: UITableViewHeaderFooterView) {
        headerView.contentView.backgroundColor = self.backgroundColor
    }
}
