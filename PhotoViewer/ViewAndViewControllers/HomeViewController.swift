//
//  HomeViewController.swift
//  PhotoViewer
//
//  Created by Dutta, Soumitra on 22/05/19.
//  Copyright © 2019 Soumitra. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var refreshControl = UIRefreshControl()
    
    @IBOutlet weak var tablePhoto: UITableView!
    var isPhotoServiceRunning = false
    lazy var photoTableDataSource : PhotoTableDataSource = {
        return PhotoTableDataSource()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = PhotoviewerConstants.customColor.themeGray
        setUpTableView()
        registerCells()
        initViewModel()
        tablePhoto.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = PhotoviewerConstants.home
        navigationController?.navigationBar.isHidden = false
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.tintColor = PhotoviewerConstants.customColor.themeBlue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: PhotoviewerConstants.customColor.themeBlue]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        PhotoDownloadManager.shared.clearCache()
    }
    
    // MARK: - SetUp TableView UI
    func setUpTableView(){
        tablePhoto.estimatedRowHeight = CGFloat(PhotoviewerConstants.tablePhotoEstimatedRowHeight)
        tablePhoto.rowHeight = UITableView.automaticDimension
        tablePhoto.estimatedSectionHeaderHeight = CGFloat(PhotoviewerConstants.tablePhotoEstimatedHeaderHeight)
        tablePhoto.sectionHeaderHeight = UITableView.automaticDimension
        tablePhoto.layer.masksToBounds = true
        tablePhoto.layer.borderWidth = 1
        tablePhoto.layer.borderColor = PhotoviewerConstants.customColor.themeBlue.cgColor
        tablePhoto.dataSource = self
        tablePhoto.delegate = self
        tablePhoto.accessibilityIdentifier = PhotoviewerConstants.AccessibiltyIdentifier.photoTable
        setUpTableViewRefreshControl()
    }
    
    // MARK: - Register UITableViewCell And Headers
    func registerCells() {
        tablePhoto.register(UINib(nibName: PhotoviewerConstants.defaultTableHeaderViewName, bundle: nil), forHeaderFooterViewReuseIdentifier: DefaultTableHeaderView.reuseIdentifier)
    }
    
    // MARK: - TableView Refresh Control
    func setUpTableViewRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: PhotoviewerConstants.pullToRefresh)
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        refreshControl.tintColor = PhotoviewerConstants.customColor.themeBlue
        tablePhoto.addSubview(refreshControl)
    }
    
    // MARK: - Refresh Control Action
    @objc func handleRefresh() {
        if (refreshControl.isRefreshing) {
            refreshControl.endRefreshing()
            refreshControl.beginRefreshing()
        }
        photoTableDataSource.initFetchwithLoading(displayLoading: false)
        
    }
    
    // MARK: - Initiate View Model
    
    func initViewModel() {
        
        photoTableDataSource.showHideLoading = { [weak self] in
            let loading = self?.photoTableDataSource.isLoading ?? false
            if loading {
                LoadingOverlay.shared.showOverlay(view: self?.view)
            }
            else{
                LoadingOverlay.shared.hideOverlayView()
                DispatchQueue.main.async {
                    if (self?.refreshControl) != nil {
                        if ((self?.refreshControl.isRefreshing)!) {
                            self?.refreshControl.endRefreshing()
                        }
                    }
                }
            }
        }
        
        photoTableDataSource.reloadPhotoListTable = { [weak self] in
            DispatchQueue.main.async {
                if (self?.refreshControl) != nil {
                    if ((self?.refreshControl.isRefreshing)!) {
                        self?.refreshControl.endRefreshing()
                    }
                }
                self?.tablePhoto.reloadData()
                self?.tablePhoto.isHidden = false
            }
            
        }
        
        photoTableDataSource.showAlert = { [weak self] in
            DispatchQueue.main.async {
                if ((self?.refreshControl.isRefreshing)!) {
                    self?.refreshControl.endRefreshing()
                }
                CommonAlertView.showCommonAlert(viewController: self!, title: "Movie App", message: (self?.photoTableDataSource.alertMessage)!, OkButtonTitle: "OK")
            }
            
        }
        photoTableDataSource.initFetchwithLoading(displayLoading: true)
        
    }
    
    
    
    
}

// MARK: - Table view data source & Delegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return photoTableDataSource.sectionList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoTableDataSource.sectionList[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = photoTableDataSource.sectionList[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: (item.cellIdentifier), for: indexPath)
        
        item.configure(cell: cell, tableView: tableView, indexPath: indexPath as NSIndexPath)
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerItem = photoTableDataSource.sectionList[section].headerItem {
            let headerView = tablePhoto.dequeueReusableHeaderFooterView(withIdentifier: (headerItem.reuseIdentifier))
            headerItem.configure(headerView: headerView!)
            return headerView
        }
        return nil
    }
    
    // MARK: TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = photoTableDataSource.sectionList[indexPath.section].items[indexPath.row]
        item.execute(with: self, animated : true)
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return UITableView.automaticDimension
        
    }
    
}





