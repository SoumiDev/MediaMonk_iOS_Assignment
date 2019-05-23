//
//  WelcomeViewController.swift
//  PhotoViewer
//
//  Created by Dutta, Soumitra on 22/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    var isPushedToHome = false
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = PhotoviewerConstants.welcomScreenTitle
        navigationController?.navigationBar.isHidden = true
        setUpUIAnimation()
    }
    
    // MARK:- View Animation
    func setUpUIAnimation(){
        /* Do Animations */
        CATransaction.begin()
        CATransaction.setAnimationDuration(2.0)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut))
        
        // View animations
        UIView.animate(withDuration: 2.0) { [weak self] in
            self?.lblTitle.frame = CGRect(x: 0, y: 0, width: PhotoviewerConstants.ViewAnimation.finalWidth, height: PhotoviewerConstants.ViewAnimation.finalHeight)
            self?.lblTitle.center = (self?.view.center)!
            self?.lblTitle.font = UIFont.boldSystemFont(ofSize: 24.0)
            self?.preParePushToHomeView()
        }
        
        // Layer animations
        let cornerAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
        cornerAnimation.fromValue = PhotoviewerConstants.ViewAnimation.initialWidth
        cornerAnimation.toValue = PhotoviewerConstants.ViewAnimation.finalWidth/2
        
        lblTitle.layer.cornerRadius = PhotoviewerConstants.ViewAnimation.finalWidth/2
        lblTitle.layer.add(cornerAnimation, forKey: #keyPath(CALayer.cornerRadius))
        
        CATransaction.commit()
    }
    
    // MARK:- Navigation
    func preParePushToHomeView(){
        //Check Networko Available
        if NetworkMonitoringManager.shared.isConnectionAvailable && !isPushedToHome{
            self.isPushedToHome = true
            let deadlineTime = DispatchTime.now() + .seconds(3)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) { [weak self] in
                self?.pushToHomeView()
            }
        }
    }
    
    func pushToHomeView(){
        let storyboard = UIStoryboard(name: PhotoviewerConstants.mainStoryboardName, bundle: nil)
        let homeViewController = storyboard.instantiateViewController(withIdentifier: PhotoviewerConstants.Identifier.homeViewController) as! HomeViewController
        navigationController?.pushViewController(homeViewController, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        PhotoDownloadManager.shared.clearCache()
    }
    
    
    
    
}


