//
//  WeatherAPIClient.swift
//  weather
//
//  Created by Radharani Ribas-Valongo on 10/21/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import Foundation

class WeatherAPIClient {
    private init() {}
    static let shared = WeatherAPIClient()
    
    func getWeather(id: Int, completionHandler: @escaping (Result<[Weather],ErrorHandling>) -> Void ) {
        
        let urlStr = "" // insert Dark Skys url
        
        NetworkManager.shared.fetchData(urlStr: urlStr) { (result) in
            switch result {
            case .failure(let appError):
                completionHandler(.failure(appError))
            case .success(let data):
                do {
                    let WeatherData = try JSONDecoder().decode([Weather].self, from: data)
                    completionHandler(.success(WeatherData))
                } catch {
                    completionHandler(.failure(ErrorHandling.decodingError))
                }
            }
        }
    }
}
