//
//  ErrorHandling.swift
//  weather
//
//  Created by Radharani Ribas-Valongo on 10/21/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import Foundation

enum ErrorHandling: Error {
    case badURL
    case decodingError
    case noData
    case networkError
    case badHTTPResponse
    case notFound
    case unauthorized
    case other(String)
}
