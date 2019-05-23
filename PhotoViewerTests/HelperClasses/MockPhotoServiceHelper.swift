//
//  MockPhotoServiceHelper.swift
//  PhotoViewerTests
//
//  Created by Dutta, Soumitra on 23/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import Foundation
@testable import PhotoViewer

class MockPhotoServiceHelper : PhotoServiceHelperProtocol {
    
    var webServiceCallShouldSucceed:Bool?
    func photoServiceRequest(successBlock: @escaping (_ result: [ResponseDic]) -> Void, failureBlock : @escaping (_ result: ResponseDic) -> Void){
        if webServiceCallShouldSucceed! {
            
            let photoTestData = PhotoTestData()
            successBlock(photoTestData.getPhotoDataArrayOfDic())
        }
        else {
            var errorResponse = ResponseDic()
            errorResponse[PhotoviewerConstants.error] = PhotoviewerConstants.error
            failureBlock(errorResponse)
        }
        
    }
    
}


