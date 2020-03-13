//
//  Enum.swift
//  viajabessa
//
//  Created by Rafael Melo on 11/03/20.
//  Copyright © 2020 Rafael Melo. All rights reserved.
//

import Foundation

enum RequestType<T> {
    case success(T)
    case failure(Error)
}
