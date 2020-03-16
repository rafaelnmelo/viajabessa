//
//  PackageDetailViewController.swift
//  viajabessa
//
//  Created by Rafael Melo on 10/03/20.
//  Copyright © 2020 Rafael Melo. All rights reserved.
//

import Kingfisher
import UIKit

class PackageDetailViewController: UIViewController {
    
    var packageDetail: Package?
    
    @IBOutlet weak var packageImage: UIImageView!
    @IBOutlet weak var packageTitle: UILabel!
    @IBOutlet weak var packageSubtitle: UILabel!
    @IBOutlet weak var packageDescription: UITextView!
    @IBOutlet weak var packagePrice: UILabel!
    @IBOutlet weak var packagePeople: UILabel!
    @IBOutlet weak var packageHotelNight: UILabel!
    @IBOutlet weak var people: UIImageView!
    @IBOutlet weak var hotelNight: UIImageView!
    
    // MARK: - Configura a tela  -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPackageDescription(image: URL(string: packageDetail?.image ?? ""), title: packageDetail?.title, subTitle: packageDetail?.subtitle, description: packageDetail?.description, price: packageDetail?.price, people: packageDetail?.people, hotelNight: packageDetail?.hotelNight)
        people.image = people.image?.withRenderingMode(.alwaysTemplate)
        people.tintColor = UIColor.yellow
        hotelNight.image = hotelNight.image?.withRenderingMode(.alwaysTemplate)
        hotelNight.tintColor = UIColor.cyan
    }
    
    // MARK: - Informa quais valores entraram em quais campos - 
    
    func getPackageDescription(image: URL?, title: String?, subTitle: String?, description: String?, price: String?, people: String?, hotelNight: String?) {
        packageImage.kf.setImage(with: image)
        packageTitle.text = title
        packageSubtitle.text = subTitle
        packageDescription.text = description
        packagePrice.text = "R$ \(price ?? "")"
        packagePeople.text = people
        packageHotelNight.text = hotelNight
    }
}
