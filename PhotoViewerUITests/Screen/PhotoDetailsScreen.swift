//
//  PhotoDetailsScreen.swift
//  PhotoViewerUITests
//
//  Created by Dutta, Soumitra on 23/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import Foundation
import XCTest
class PhotoDetailsScreen {
    
    let app = XCUIApplication()
    let lblTitle : XCUIElement!
    var mainImage : XCUIElement!
    
    init() {
        lblTitle = app.staticTexts[PhotoviewerConstants.AccessibiltyIdentifier.photoDetailsLblTitle]
    }
}
