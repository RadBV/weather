//
//  Weather.swift
//  weather
//
//  Created by Radharani Ribas-Valongo on 10/21/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import Foundation

struct WeatherWrapper: Codable {
    let daily: DataWrapper
    
}

//Daily Stuff
struct DataWrapper: Codable {
    let data: [Weather]
}

struct Weather: Codable {
    let summary: String
    let icon: String
    let time: Int
    let sunriseTime: Int
    let sunsetTime: Int
    let temperatureHigh: Double
    let temperatureLow: Double
    let windSpeed: Double
    var precipitationProbability: String
    let precipProbability: Double
    var precipitationChance: String {
        get {
            return "\(precipProbability * 100)%"
        }
    }
    var date : String {
        get {
            let date = NSDate(timeIntervalSince1970: TimeInterval(time)) as Date
            let df = DateFormatter()
            df.dateFormat = "MMM-dd-yyyy"
            return df.string(from:date)
        }
    }
    var realSunRiseTime: String {
        get {
            let date = NSDate(timeIntervalSince1970: TimeInterval(sunriseTime)) as Date
            let df = DateFormatter()
            df.dateFormat = "hh:mm a"
            df.amSymbol = "AM"
            df.pmSymbol = "PM"
            return df.string(from:date)
        }
    }
    var realSunSetTime: String {
        get {
            let date = NSDate(timeIntervalSince1970: TimeInterval(sunsetTime)) as Date
            let df = DateFormatter()
            df.dateFormat = "hh:mm a"
            df.amSymbol = "AM"
            df.pmSymbol = "PM"
            return df.string(from:date)
        }
    }
}


    //TODO: don't forgot timeIntervalSince1970
    
    //TODO: FIGURE OUT WHY THIS ENUM ISN'T WORKING
//    private enum CodingKeys: String, CodingKey {
//        case summary, icon, windSpeed
//        case temperatureHigh = "high"
//        case temperatureLow = "low"
//    }

