//
//  Configuration.swift
//  Weather
//
//  Created by Yusuf U on 9.06.2018.
//  Copyright © 2018 Yusuf U. All rights reserved.
//

import Foundation
struct API {
    static let APIKey = "297e3760012d017ff385fc5e57e08d9a"
    static let BaseURL = URL(string: "https://api.darksky.net/forecast/")!
    static var AuthenticatedBaseURL: URL {
        return BaseURL.appendingPathComponent(APIKey)
    }
}
