//
//  WebserviceRequestManager.swift
//  PhotoViewer
//
//  Created by Dutta, Soumitra on 22/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import Foundation

typealias ResponseDic = [String:Any]

class WebserviceRequestManager {
    static let shared = WebserviceRequestManager()
    
    func callService ( urlString : String, successBlock: @escaping (_ result: [ResponseDic]) -> Void, failureBlock : @escaping (_ result: ResponseDic) -> Void)
    {
        guard let url = URL(string: urlString) else {
            return
        }
        // SetUp URL Session
        let sessionConfig = URLSessionConfiguration.default
        // Configure Session
        sessionConfig.timeoutIntervalForRequest = Websettings.shared.requestTimeOut
        sessionConfig.timeoutIntervalForResource = Websettings.shared.requestTimeOut
        let session = URLSession(configuration: sessionConfig)
        // Create Session Task
        let task =  session.dataTask(with: url, completionHandler:{data, response, error -> Void in
            // Task Completed
            if error != nil {
                // Error is Response
                var errorResponse = ResponseDic()
                errorResponse[PhotoviewerConstants.error] = PhotoviewerConstants.error
                failureBlock(errorResponse)
            }
            if data == nil
            {
                // Error is Response Data
                var errorResponse = ResponseDic()
                errorResponse[PhotoviewerConstants.error] = PhotoviewerConstants.error
                failureBlock(errorResponse)
            }
            else
            {
                if  let utf8Text = String(data: data! , encoding: .utf8) {
                    // Successful Response
                    successBlock(self.convertStringToDictionary(text: utf8Text) as! [ResponseDic])
                }
                else
                {
                    // Error is Response Data
                    var errorResponse = ResponseDic()
                    errorResponse[PhotoviewerConstants.error] = PhotoviewerConstants.error
                    failureBlock(errorResponse)
                }
            }
        })
        // Execute Session Task
        task.resume()
    }
    
}


extension WebserviceRequestManager {
    
    func convertStringToDictionary(text: String) -> [Any] {
        if let data = text.data(using: String.Encoding.utf8) {
            do {
                let arrData =  try JSONSerialization.jsonObject(with: data, options: [])
                return arrData as! [Any]
                
            } catch let error as NSError {
                var errorResponse = ResponseDic()
                errorResponse[PhotoviewerConstants.error] = PhotoviewerConstants.error
                print(error)
                return [errorResponse]
            }
        }
        var errorResponse = ResponseDic()
        errorResponse[PhotoviewerConstants.error] = PhotoviewerConstants.error
        return [errorResponse]
    }
}
