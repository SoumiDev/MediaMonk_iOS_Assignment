//
//  DefaultTableHeaderView.swift
//  PhotoViewer
//
//  Created by Dutta, Soumitra on 22/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import UIKit

class DefaultTableHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var titleLabel: UILabel!
    static let reuseIdentifier = PhotoviewerConstants.Identifier.defaultTableHeaderView
    
    
}
