//
//  HomeScreen.swift
//  PhotoViewerUITests
//
//  Created by Dutta, Soumitra on 23/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import Foundation
import XCTest
class HomeScreen {
    
    let app = XCUIApplication()
    let photoTable: XCUIElement!
    
    init() {
        //tableview
        photoTable = app.tables[PhotoviewerConstants.AccessibiltyIdentifier.photoTable]
        
    }
    
    
}
