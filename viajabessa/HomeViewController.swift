//
//  HomeViewController.swift
//  viajabessa
//
//  Created by Rafael Melo on 10/03/20.
//  Copyright © 2020 Rafael Melo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var packageInfo: PackageInfo?
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        getPackage()
        tableView.register(UINib(nibName: "Package", bundle: nil), forCellReuseIdentifier: "PackageCell")
        self.tableView.separatorStyle = .singleLine
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
    }
    
    func getPackage() {
        let homePresenter = HomePresenter(reference: self)
        homePresenter.buildPackage()
    }
}

extension  HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.packageInfo?.travelPackage.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let travelPackage = tableView.dequeueReusableCell(withIdentifier: "PackageCell", for: indexPath) as? PackageCell {
            travelPackage.getPackage(package: packageInfo?.travelPackage[indexPath.row])
            return travelPackage
        }
        return UITableViewCell()
    }
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: HomePresenterDelegate {
    func provideViewContent(with package: PackageInfo) {
        self.packageInfo = package
        self.tableView.reloadData()
    }
    
    func showError(error: String) {
        print(error)
    }
    

    
    
}



