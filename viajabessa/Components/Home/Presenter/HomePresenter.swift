//
//  HomePresenter.swift
//  viajabessa
//
//  Created by Rafael Melo on 11/03/20.
//  Copyright © 2020 Rafael Melo. All rights reserved.
//

import Foundation

// MARK: - Indica os PROTOCOLOS necessários -

protocol HomePresenterDelegate {
    func provideViewContent(with package: PackageInfo)
    func showError(error: String)
}

class HomePresenter {
    
    // MARK: - Chama os SERVIÇOS necessários -
    
    let homeService = PackageInfoService()
    var delegate: HomePresenterDelegate?
    
    // MARK: - Inicia a classe referenciando o próprio HomePresenterDelegate como a váriável delegate -
    
    init(reference: HomePresenterDelegate) {
        self.delegate = reference
    }
    
    // MARK: - Função que verifica a resposta e coloca os itens em um Package - 
    
    func buildPackage() {
        self.homeService.loadPackageInfo { (response) in
            switch response {
            case .success(let result):
                var object = PackageInfo()
                if result.travelPackage.isEmpty == false {
                    for package in result.travelPackage {
                        if let packageTitle = package.title, packageTitle.isEmpty == false, let packagePrice = package.price, packagePrice.isEmpty == false, let packageSubtitle = package.subtitle, let packagePeople = package.people, packagePeople.isEmpty == false, let packageHotelNight = package.hotelNight, packageHotelNight.isEmpty == false, packageSubtitle.isEmpty == false, let packageDescription = package.description, packageDescription.isEmpty == false, let packageImage = package.image, packageImage.isEmpty == false {
                            let packageItem = Package(title: packageTitle, subtitle: packageSubtitle, discount: package.discount, people: packagePeople, hotelNight: packageHotelNight, description: packageDescription, price: packagePrice, image: packageImage)
                            object.travelPackage.append(packageItem)
                        }
                    }
                }
                self.delegate?.provideViewContent(with: object)
                break
            case .failure(let error):
                self.delegate?.showError(error: error.localizedDescription)
            }
        }
    }
}
