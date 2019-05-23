//
//  TableSection.swift
//  PhotoViewer
//
//  Created by Dutta, Soumitra on 22/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import Foundation
class TableSection {
    var identifier: String = ""
    var headerItem: TableHeaderItem?
    var items = [TableSectionItem]()
    
    // MARK: Helper Methods
    func getNumberOfItems() -> Int { return  self.items.count  }
    func getItem(for index: Int) -> TableSectionItem? { return self.items[index] }
}
