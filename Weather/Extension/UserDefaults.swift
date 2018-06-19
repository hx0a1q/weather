//
//  UserDefaulta.swift
//  Weather
//
//  Created by Yusuf U on 10.06.2018.
//  Copyright © 2018 Yusuf U. All rights reserved.
//

import Foundation

enum UserDefaultsKey:Stringable{
    case timeNotation
    case unitNotation
    case temperatureNotation
}

enum TimeNotation: Int{
    case twelweHour
    case twentyHour
}

enum UnitNotation: Int{
    case imperial
    case metric
}

enum TemperaturNotation: Int{
    case fahrenheit
    case celsius
}


extension UserDefaults{
    static func timeNotation() -> TimeNotation{
        let storedValue = UserDefaults.standard.integer(forKey: UserDefaultsKey.timeNotation.string)
        return TimeNotation(rawValue: storedValue) ?? .twelweHour
    }
    
    static func setTimeNotetion(timeNotation: TimeNotation){
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKey.timeNotation.string)
    }
    
    static func unitNotation() -> UnitNotation{
        let storedValue = UserDefaults.standard.integer(forKey: UserDefaultsKey.unitNotation.string)
        return UnitNotation(rawValue: storedValue) ?? .metric
    }

    static func setUnitNotation(unitNotation: UnitNotation){
        UserDefaults.standard.set(unitNotation.rawValue, forKey: UserDefaultsKey.unitNotation.string)
    }
    
    static func temperatureNotation() -> TemperaturNotation{
        let storedValue = UserDefaults.standard.integer(forKey: UserDefaultsKey.temperatureNotation.string)
        return TemperaturNotation(rawValue: storedValue) ?? .fahrenheit
    }
    
    static func setTemperatureNotation(temperatureNotation: TemperaturNotation){
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKey.temperatureNotation.string)
    }
}
