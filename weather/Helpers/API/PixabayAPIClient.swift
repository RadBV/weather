//
//  PixabayAPIClient.swift
//  weather
//
//  Created by Radharani Ribas-Valongo on 10/22/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import Foundation

class PixabayAPIClient {
    private init() {}
    static let shared = PixabayAPIClient()
    
    func getWeather(completionHandler: @escaping (Result<[Pixabay],ErrorHandling>) -> Void ) {
        
        let urlStr = "" // insert Pixabay url
        
        NetworkManager.shared.fetchData(urlStr: urlStr) { (result) in
            switch result {
            case .failure(let appError):
                completionHandler(.failure(appError))
            case .success(let data):
                do {
                    let WeatherData = try JSONDecoder().decode([Pixabay].self, from: data)
                    completionHandler(.success(WeatherData))
                } catch {
                    completionHandler(.failure(ErrorHandling.decodingError))
                }
            }
        }
    }
}
