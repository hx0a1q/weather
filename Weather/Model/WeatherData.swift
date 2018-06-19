//
//  WeatherData.swift
//  Weather
//
//  Created by Yusuf U on 10.06.2018.
//  Copyright © 2018 Yusuf U. All rights reserved.
//

import Foundation

struct WeatherData: Codable{
    let latitude: Double
    let longitude: Double
    let timezone: String
    let currently: WeatherDataCurrently
    let daily: WeatherDataDaily

}
struct WeatherDataCurrently: Codable {
    let time: TimeInterval
    let summary: String
    let icon: String
    let temperature: Double
    let humidity: Double
    let windSpeed: Double
}
struct WeatherDataDaily: Codable{
    let icon: String
    let summary: String
    let data: [WeatherDataDailyData]
}

struct WeatherDataDailyData:Codable {
    let time: TimeInterval
    let temperatureMin: Double
    let temperatureMax: Double
    let windSpeed: Double

}
