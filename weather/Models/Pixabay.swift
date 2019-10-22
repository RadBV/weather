//
//  Pixabay.swift
//  weather
//
//  Created by Radharani Ribas-Valongo on 10/21/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import Foundation

struct Pixabay: Codable {
    let hits: [PixabayWrapper]
}

struct PixabayWrapper: Codable {
    let largeImageURL: String
    
//    enum CodingKeys: String, CodingKey {
//        case largeImageURL = "largePhoto"
//    }
}
