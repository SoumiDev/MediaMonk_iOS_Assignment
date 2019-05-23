//
//  TableSectionItem.swift
//  PhotoViewer
//
//  Created by Dutta, Soumitra on 22/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import UIKit

class TableSectionItem {
    
    var cellIdentifier: String = ""
    var title: String?
    var thumbnailImageUrl: String?
    var mainImageUrl: String?
    var cellAccessoryType = UITableViewCell.AccessoryType.none
    
    func configure(cell: UITableViewCell,tableView: UITableView, indexPath : NSIndexPath) {
        cell.accessoryType = self.cellAccessoryType
    }
    
    func execute(with viewController: UIViewController, animated: Bool) {
        //Subcalsses need to ovveride this if they need Action
        return
    }
}
