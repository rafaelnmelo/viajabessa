//
//  PackageInfoService.swift
//  viajabessa
//
//  Created by Rafael Melo on 11/03/20.
//  Copyright © 2020 Rafael Melo. All rights reserved.
//

import Foundation
import Alamofire

class PackageInfoService {
    
    func loadPackageInfo(completionHandler: @escaping (_ response: RequestType<PackageInfo>) -> Void) {
        let url = "https://private-6f2d9-rafael43.apiary-mock.com/travel"
        Alamofire.request(url).responseJSON { (response) in
            do {
                if let data = response.data {
                    let packageInfo = try JSONDecoder().decode(PackageInfo.self, from: data)
                    completionHandler(.success(packageInfo))
                }
            }catch let error {
                completionHandler(.failure(error))
            }
        }
    }
}
