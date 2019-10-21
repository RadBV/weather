//
//  Weather.swift
//  weather
//
//  Created by Radharani Ribas-Valongo on 10/21/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let daily: DailyWrapper
    
}

//Daily Stuff
struct DailyWrapper: Codable {
    let data: [DailyData]
}

struct DailyData: Codable {
    let summary: String
    let icon: String
    let temperatureHigh: Double
    let temperatureLow: Double
    let windSpeed: Double

    
    
    //TODO: FIGURE OUT WHY THIS ENUM ISN'T WORKING
//    private enum CodingKeys: String, CodingKey {
//        case summary, icon, windSpeed
//        case temperatureHigh = "high"
//        case temperatureLow = "low"
//    }
}
