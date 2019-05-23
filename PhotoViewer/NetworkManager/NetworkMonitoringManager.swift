//
//  NetworkMonitoringManager.swift
//  PhotoViewer
//
//  Created by Dutta, Soumitra on 22/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import UIKit
class NetworkMonitoringManager {
    static let shared = NetworkMonitoringManager()
    let reachability = Reachability()!
    var isConnectionAvailable = false
    
    
    func setUpNetworkMonitoring(){
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged), name: NSNotification.Name.reachabilityChanged, object: nil)
        
        do{
            try reachability.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
    }
    
    func isReachable() -> Bool{
        if (self.reachability.connection != .none){
            return true
        }
        else{
            return false
        }
    }
    
    func isUnreachable() -> Bool {
        if (self.reachability.connection == .none){
            return true
        }
        else{
            return false
        }
    }
    
    func isReachableViaWWAN() -> Bool{
        if (self.reachability.connection == .cellular){
            
            return true
        }
        else{
            
            return false
        }
    }
    
    func isReachableViaWiFi() ->Bool{
        if (self.reachability.connection == .wifi){
            
            return true
        }
        else{
            
            return false
        }
    }
    
    
    @objc func reachabilityChanged(note: Notification) {
        
        let reachability = note.object as! Reachability
        self.isConnectionAvailable = reachability.connection != .none
        
        switch reachability.connection {
        case .wifi:
            print("Reachable via WiFi")
            checkPhotoDataStatus()
        case .cellular:
            print("Reachable via Cellular")
            checkPhotoDataStatus()
        case .none: do {
            print("Network not reachable")
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            CommonAlertView.showCommonAlert(viewController: (appdelegate.window?.rootViewController)!, title: PhotoviewerConstants.projectName, message: PhotoviewerConstants.noInternetConnection, OkButtonTitle: PhotoviewerConstants.okAlertTitle)
            }
        }
    }
}


extension NetworkMonitoringManager {
    
    func checkPhotoDataStatus(){
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let currentVC =  appdelegate.navigationController?.visibleViewController
        if currentVC is WelcomeViewController {
            let  vc = currentVC as! WelcomeViewController
            vc.preParePushToHomeView()
        }
        else if currentVC is HomeViewController {
            let  vc = currentVC as! HomeViewController
            if !vc.isPhotoServiceRunning {
                //vc.photoServiceCall(showLoader: true)
            }
        }
    }
}
