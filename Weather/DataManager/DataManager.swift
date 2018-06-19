//
//  DataManager.swift
//  Weather
//
//  Created by Yusuf U on 10.06.2018.
//  Copyright © 2018 Yusuf U. All rights reserved.
//

import Foundation
import UIKit


enum WeatherDataError: Error{
    case unknow
    case jsonError
    case responseError
    case error(message: String)
}

final class DataManager{
    typealias Result = ((_ weather: WeatherData?, _ error: WeatherDataError?) -> Void)
    private let baseURL: URL
    
    init(url: URL) {
        self.baseURL = url
    }
    
    func getWeather(latitude: Double, longitude: Double, completion: @escaping Result){
        let session = URLSession.shared
        let requestURL = baseURL.appendingPathComponent("\(latitude),\(longitude)")
        let url = URL(string: "?lang=tr", relativeTo: requestURL)!
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                self.didFetchWeatherData(data: data, response: response, error: error, completion: completion)
            }
        }
        task.resume()
    }
    
    private func didFetchWeatherData(data: Data?, response: URLResponse?, error: Error?, completion: @escaping Result){
        if let error = error{
            completion(nil, WeatherDataError.error(message: error.localizedDescription))
            return
        }else if let data = data,
            let httpResponse = response as? HTTPURLResponse,
            let statusCode = httpResponse.statusCode as Int?
        {
            switch statusCode{
            case 200:
                do{
                    let json = try JSONDecoder().decode(WeatherData.self, from: data)
                    completion(json, nil)
                }catch let error{
                    completion(nil, WeatherDataError.error(message: error.localizedDescription))
                }
            default:
                completion(nil, WeatherDataError.responseError)
                return
            }
        }else{
            completion(nil, WeatherDataError.unknow)
        }
    }
}
