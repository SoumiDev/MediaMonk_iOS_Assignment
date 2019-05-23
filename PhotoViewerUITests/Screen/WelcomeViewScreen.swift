//
//  WelcomeViewScreen.swift
//  PhotoViewerUITests
//
//  Created by Dutta, Soumitra on 23/05/19
//  Copyright © 2019 Soumitra. All rights reserved.
//

import Foundation
import XCTest
class WelcomeViewScreen {
    let app = XCUIApplication()
    let lblTitle : XCUIElement!
    
    init() {
        lblTitle = app.staticTexts["Welcome-LblTitle"]
    }
    
}
