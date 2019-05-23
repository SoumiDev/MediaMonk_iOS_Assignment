//
//  WebSettings.swift
//  PhotoViewer
//
//  Created by Dutta, Soumitra on 22/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import Foundation


struct Websettings {
    
    static let shared = Websettings()

    //MARK: - Webservice URL
    //Development Settings
    #if DEVELOPMENT
    let BaseURL = "http://jsonplaceholder.typicode.com/photos"
    let requestTimeOut = 120.0
    // TODO: Additional endpoints...
    
    // Production Settings
    #elseif PRODUCTION
    let BaseURL = "http://jsonplaceholder.typicode.com/photos"
    let requestTimeOut = 60.0
    // TODO: Additional endpoints...
    
    #endif
}
