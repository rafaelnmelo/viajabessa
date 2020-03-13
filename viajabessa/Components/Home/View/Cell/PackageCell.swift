//
//  Package.swift
//  viajabessa
//
//  Created by Rafael Melo on 10/03/20.
//  Copyright © 2020 Rafael Melo. All rights reserved.
//

import UIKit
import Kingfisher

class PackageCell: UITableViewCell {

    @IBOutlet weak var packageImage: UIImageView!
    @IBOutlet weak var packageTitle: UILabel!
    @IBOutlet weak var packagePrice: UILabel!
    @IBOutlet weak var packageDiscount: UIImageView!
    @IBOutlet weak var packageSubtitle: UILabel!
    @IBOutlet weak var packagePeople: UILabel!
    @IBOutlet weak var packageHotelNight: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func getPackage(package: Package?) {
        packageTitle.text = package?.title
        packageSubtitle.text = package?.subtitle
        packagePeople.text = package?.people
        packageHotelNight.text = package?.hotelNight
        packagePrice.text = " R$ \(package?.price ?? "")"
        packageImage.layer.masksToBounds = true
        packageImage.layer.cornerRadius = packageImage.frame.height/2
        packageImage.kf.setImage(with: URL(string: package?.image ?? ""))
        if package?.discount == true {
            packageDiscount.isHidden = false
        }
    }
}
