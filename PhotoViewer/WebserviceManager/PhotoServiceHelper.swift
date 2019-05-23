//
//  PhotoServiceHelper.swift
//  PhotoViewer
//
//  Created by Dutta, Soumitra on 22/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import Foundation

protocol PhotoServiceHelperProtocol {
    func photoServiceRequest(successBlock: @escaping (_ result: [ResponseDic]) -> Void, failureBlock : @escaping (_ result: ResponseDic) -> Void)
}
class PhotoServiceHelper: PhotoServiceHelperProtocol {
    
    func photoServiceRequest(successBlock: @escaping (_ result: [ResponseDic]) -> Void, failureBlock : @escaping (_ result: ResponseDic) -> Void){
        
        WebserviceRequestManager.shared.callService(urlString: Websettings.shared.BaseURL, successBlock: {(response) in
            successBlock(response)
        },
                                                    failureBlock: {(response) in
                                                        failureBlock(response)
        })
    }
}
