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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
