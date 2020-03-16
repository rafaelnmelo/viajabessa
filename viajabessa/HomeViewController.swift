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
    
    // MARK: função que configura e registra a célula na tela
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.getPackage()
        tableView.register(UINib(nibName: "Package", bundle: nil), forCellReuseIdentifier: "PackageCell")
        self.tableView.separatorStyle = .singleLine
    }
    
    // MARK: função que chama o contrutor da célula
    
    func getPackage() {
        let homePresenter = HomePresenter(reference: self)
        homePresenter.buildPackage()
    }
}

extension  HomeViewController: UITableViewDataSource {
    
    // MARK: Altura da célula
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    // MARK: Quantidade de células
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.packageInfo?.travelPackage.count ?? 0
    }
    
    // MARK: Alimentação da célula
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let travelPackage = tableView.dequeueReusableCell(withIdentifier: "PackageCell", for: indexPath) as? PackageCell {
            travelPackage.getPackage(package: packageInfo?.travelPackage[indexPath.row])
            return travelPackage
        }
        return UITableViewCell()
    }
    
    // MARK: Passagem para PackageDetail contendo a célula clicada
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let storyboard = UIStoryboard(name: "PackageDetail", bundle: nil).instantiateViewController(withIdentifier: "PackageDetail") as? PackageDetailViewController{
            storyboard.packageDetail = self.packageInfo?.travelPackage[indexPath.row] ?? nil
            self.navigationController?.pushViewController(storyboard, animated: true)
        }
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
}

// MARK: Faz o link com o presenter(que popula a célula)

extension HomeViewController: HomePresenterDelegate {
    func provideViewContent(with package: PackageInfo) {
        self.packageInfo = package
        self.tableView.reloadData()
    }
    
    func showError(error: String) {
        print(error)
    }
    

    
    
}



