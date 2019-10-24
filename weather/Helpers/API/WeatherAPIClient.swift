//
//  WeatherAPIClient.swift
//  weather
//
//  Created by Radharani Ribas-Valongo on 10/21/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import Foundation

class WeatherAPIHelper {
    private init() {}
    static let manager = WeatherAPIHelper()
    func getDailyWeather(info: (lat:Double,long:Double),completionHandler: @escaping (Result<[Weather],ErrorHandling>) -> ()) {
        
        let urlString = "https://api.darksky.net/forecast/69003be1dadffd2f9a53730f99ddc76a/\(String(info.lat)),\(String(info.long))"
        
        NetworkManager.shared.fetchData(urlStr: urlString) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let weather = try JSONDecoder().decode(WeatherWrapper.self, from: data)
                    completionHandler(.success(weather.daily.data))
                } catch {
                    completionHandler(.failure(.decodingError))
                }
            }
        }
    }
}
