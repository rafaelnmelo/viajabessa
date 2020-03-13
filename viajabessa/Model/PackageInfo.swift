//
//  PackageInfo.swift
//  viajabessa
//
//  Created by Rafael Melo on 11/03/20.
//  Copyright © 2020 Rafael Melo. All rights reserved.
//

import Foundation

struct PackageInfo: Codable {
    var travelPackage = [Package]()
}

struct Package: Codable {
    let title: String?
    let subtitle: String?
    let discount: Bool?
    let people: String?
    let hotelNight: String?
    let description: String?
    let price: String?
    let image: String?
}
